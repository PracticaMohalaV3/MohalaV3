from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.db.models import Avg
from cuestionario.models import Trabajador, Autoevaluacion, EvaluacionJefatura, ResultadoConsolidado, TextosEvaluacion

@login_required
def detalle_seguimiento(request, trabajador_id):
    if not request.user.is_superuser:
        return redirect('index')
    
    try:
        trabajador = Trabajador.objects.select_related(
            'cargo', 'nivel_jerarquico', 'id_jefe_directo'
        ).get(id_trabajador=trabajador_id)
    except Trabajador.DoesNotExist:
        return redirect('seguimiento_admin')

    empresa = trabajador.empresa

    resultados = ResultadoConsolidado.objects.filter(
        trabajador=trabajador
    ).order_by('textos_evaluacion_codigo_excel')

    codigos = list(resultados.values_list('textos_evaluacion_codigo_excel', flat=True).distinct())

    textos_qs = TextosEvaluacion.objects.filter(
        empresa=empresa,
        codigo_excel__in=codigos
    ).select_related('dimension', 'competencia')

    textos_map = {t.codigo_excel: t for t in textos_qs}

    # Enriquecer cada resultado con su TextosEvaluacion y agrupar por dimensión
    dimensiones_data = {}
    for r in resultados:
        texto_eval = textos_map.get(r.textos_evaluacion_codigo_excel)
        if not texto_eval:
            continue
        r.texto_eval = texto_eval
        dim_nombre = texto_eval.dimension.nombre_dimension
        if dim_nombre not in dimensiones_data:
            dimensiones_data[dim_nombre] = []
        dimensiones_data[dim_nombre].append(r)

    # Calcular promedios por dimensión y total
    promedios_por_dimension = {}
    for dim_nombre, lista in dimensiones_data.items():
        ids = [r.id_resultado_consolidado for r in lista]
        avg = ResultadoConsolidado.objects.filter(
            id_resultado_consolidado__in=ids
        ).aggregate(Avg('diferencia'))['diferencia__avg']
        promedios_por_dimension[dim_nombre] = avg

    diff_promedio_total = resultados.aggregate(Avg('diferencia'))['diferencia__avg']

    auto = Autoevaluacion.objects.filter(trabajador=trabajador, estado_finalizacion=True).first()
    jefe = EvaluacionJefatura.objects.filter(trabajador_evaluado=trabajador, estado_finalizacion=True).first()

    context = {
        'trabajador': trabajador,
        'dimensiones_data': dimensiones_data,
        'promedios_por_dimension': promedios_por_dimension,
        'diff_promedio_total': diff_promedio_total,
        'timestamp_auto': auto.momento_evaluacion if auto else None,
        'timestamp_jefe': jefe.momento_evaluacion if jefe else None,
    }

    return render(request, 'cuestionario/detalle_seguimiento.html', context)