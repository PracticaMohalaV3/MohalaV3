from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from cuestionario.models import Empresa, Dimension, Competencia, TextosEvaluacion


@login_required
def panel_edicion(request):
    if not request.user.is_superuser:
        return redirect('index')

    empresa_id = request.GET.get('empresa_id')
    empresa_actual = None
    dimensiones = []
    competencias = []
    textos = []

    if empresa_id:
        try:
            empresa_actual = Empresa.objects.get(id_empresa=empresa_id)
        except Empresa.DoesNotExist:
            pass

    if empresa_actual:
        dimensiones = Dimension.objects.filter(empresa=empresa_actual)
        competencias = Competencia.objects.filter(empresa=empresa_actual).select_related('dimension')
        textos = TextosEvaluacion.objects.filter(empresa=empresa_actual).select_related(
            'dimension', 'competencia', 'nivel_jerarquico'
        ).order_by('dimension__nombre_dimension', 'competencia__nombre_competencia', 'codigo_excel')

    context = {
        'empresas': Empresa.objects.filter(empresa_activa=True),
        'empresa_actual': empresa_actual,
        'dimensiones': dimensiones,
        'competencias': competencias,
        'textos': textos,
    }
    return render(request, 'cuestionario/edicion_cuestionario.html', context)


@login_required
def editar_dimension(request, dimension_id):
    if not request.user.is_superuser:
        return redirect('index')

    dimension = get_object_or_404(Dimension, id_dimension=dimension_id)

    if request.method == 'POST':
        nombre = request.POST.get('nombre_dimension', '').strip()
        if nombre:
            dimension.nombre_dimension = nombre
            dimension.save()
        return redirect(f'/edicion/?empresa_id={dimension.empresa.id_empresa}')  

    return redirect('panel_edicion')


@login_required
def editar_competencia(request, competencia_id):
    if not request.user.is_superuser:
        return redirect('index')

    competencia = get_object_or_404(Competencia, id_competencia=competencia_id)

    if request.method == 'POST':
        nombre = request.POST.get('nombre_competencia', '').strip()
        if nombre:
            competencia.nombre_competencia = nombre
            competencia.save()
        return redirect(f'/edicion/?empresa_id={competencia.empresa.id_empresa}')  

    return redirect('panel_edicion')


@login_required
def editar_texto(request, texto_id):
    if not request.user.is_superuser:
        return redirect('index')

    texto = get_object_or_404(TextosEvaluacion, id_textos_evaluacion=texto_id)

    if request.method == 'POST':
        nuevo_texto = request.POST.get('texto', '').strip()
        if nuevo_texto:
            texto.texto = nuevo_texto
            texto.save()
        return redirect(f'/edicion/?empresa_id={texto.empresa.id_empresa}') 

    return redirect('panel_edicion')