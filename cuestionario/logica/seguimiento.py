from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.db.models import Avg
from cuestionario.models import Trabajador, Autoevaluacion, EvaluacionJefatura, ResultadoConsolidado, Empresa

@login_required
def panel_seguimiento(request):
    es_coordinador = False
    empresa_actual = None

    if not request.user.is_superuser:
        try:
            trabajador_actual = Trabajador.objects.get(user=request.user)
            if not trabajador_actual.es_coordinador:
                return redirect('index')
            es_coordinador = True
            empresa_actual = trabajador_actual.empresa
        except Trabajador.DoesNotExist:
            return redirect('index')
    else:
        empresa_id = request.GET.get('empresa_id')
        if empresa_id:
            try:
                empresa_actual = Empresa.objects.get(id_empresa=empresa_id)
            except Empresa.DoesNotExist:
                pass

    if empresa_actual:
        trabajadores = Trabajador.objects.filter(
            empresa=empresa_actual
        ).select_related('cargo', 'empresa').order_by('-nivel_jerarquico__id_nivel_jerarquico')
    else:
        trabajadores = Trabajador.objects.none()

    autos_listas = 0
    autos_pendientes = 0
    jefaturas_listas = 0
    jefaturas_pendientes = 0
    total_por_realizar = 0

    for t in trabajadores:
        t.auto_lista = Autoevaluacion.objects.filter(trabajador=t, estado_finalizacion=True).exists()
        if t.auto_lista:
            autos_listas += 1
        else:
            autos_pendientes += 1
            total_por_realizar += 1

        if t.id_jefe_directo:
            t.tiene_jefe = True
            t.jefe_lista = EvaluacionJefatura.objects.filter(trabajador_evaluado=t, estado_finalizacion=True).exists()
            if t.jefe_lista:
                jefaturas_listas += 1
            else:
                jefaturas_pendientes += 1
                total_por_realizar += 1
        else:
            t.tiene_jefe = False
            t.jefe_lista = False

        t.diff_promedio = None
        if t.auto_lista and (not t.tiene_jefe or t.jefe_lista):
            res = ResultadoConsolidado.objects.filter(trabajador=t).aggregate(Avg('diferencia'))
            t.diff_promedio = res['diferencia__avg']

    context = {
        'trabajadores': trabajadores,
        'total_pendientes': total_por_realizar,
        'autos_listas': autos_listas,
        'autos_pendientes': autos_pendientes,
        'jefaturas_listas': jefaturas_listas,
        'jefaturas_pendientes': jefaturas_pendientes,
        'empresa_actual': empresa_actual,
        'es_coordinador': es_coordinador,
    }
    return render(request, 'cuestionario/seguimiento.html', context)