from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.contrib import messages  
from cuestionario.models import Empresa, Dimension, Competencia, TextosEvaluacion, NivelJerarquico


@login_required
def panel_edicion(request):
    if not request.user.is_superuser:
        return redirect('index')

    empresa_id = request.GET.get('empresa_id')
    empresa_actual = None
    dimensiones = []
    competencias = []
    niveles = []
    textos = []

    if empresa_id:
        try:
            empresa_actual = Empresa.objects.get(id_empresa=empresa_id)
        except Empresa.DoesNotExist:
            pass

    if empresa_actual:
        dimensiones = Dimension.objects.filter(empresa=empresa_actual)
        competencias = Competencia.objects.filter(empresa=empresa_actual).select_related('dimension')
        niveles = NivelJerarquico.objects.filter(empresa=empresa_actual)
        textos = TextosEvaluacion.objects.filter(empresa=empresa_actual).select_related(
            'dimension', 'competencia', 'nivel_jerarquico'
        ).order_by('dimension__nombre_dimension', 'competencia__nombre_competencia', 'codigo_excel')

    context = {
        'empresas': Empresa.objects.filter(empresa_activa=True),
        'empresa_actual': empresa_actual,
        'dimensiones': dimensiones,
        'competencias': competencias,
        'niveles': niveles,
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
            messages.success(request, f'✅ Dimensión "{nombre}" actualizada correctamente.')  
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
            messages.success(request, f'✅ Competencia "{nombre}" actualizada correctamente.')  
        return redirect(f'/edicion/?empresa_id={competencia.empresa.id_empresa}')

    return redirect('panel_edicion')


@login_required
def editar_nivel(request, nivel_id):
    if not request.user.is_superuser:
        return redirect('index')

    nivel = get_object_or_404(NivelJerarquico, id_nivel_jerarquico=nivel_id)

    if request.method == 'POST':
        nombre = request.POST.get('nombre_nivel_jerarquico', '').strip()
        if nombre:
            nivel.nombre_nivel_jerarquico = nombre
            nivel.save()
            messages.success(request, f'✅ Nivel jerárquico "{nombre}" actualizado correctamente.')  
        return redirect(f'/edicion/?empresa_id={nivel.empresa.id_empresa}')

    return redirect('panel_edicion')


@login_required
def editar_texto(request, texto_id):
    if not request.user.is_superuser:
        return redirect('index')

    texto = get_object_or_404(TextosEvaluacion, id_textos_evaluacion=texto_id)

    if request.method == 'POST':
        nuevo_texto = request.POST.get('texto', '').strip()
        nuevo_codigo = request.POST.get('codigo_excel', '').strip()
        if nuevo_texto:
            texto.texto = nuevo_texto
        if nuevo_codigo:
            texto.codigo_excel = nuevo_codigo
        texto.save()
        messages.success(request, f'✅ Texto "{nuevo_codigo or texto.codigo_excel}" actualizado correctamente.') 
        return redirect(f'/edicion/?empresa_id={texto.empresa.id_empresa}')

    return redirect('panel_edicion')