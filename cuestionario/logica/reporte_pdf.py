from django.shortcuts import redirect
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from cuestionario.models import Trabajador, Autoevaluacion, EvaluacionJefatura, ResultadoConsolidado, TextosEvaluacion
from reportlab.lib.pagesizes import A4
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import inch
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph, Spacer
from reportlab.lib.enums import TA_CENTER
from io import BytesIO
from xml.sax.saxutils import escape


@login_required
def generar_pdf_detalle(request, trabajador_id):
    """Genera el PDF del reporte de evaluación usando ReportLab"""
    if not request.user.is_superuser:
        return redirect('index')
    
    try:
        trabajador = Trabajador.objects.select_related('cargo', 'nivel_jerarquico', 'id_jefe_directo').get(id_trabajador=trabajador_id)
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

    resultados_por_dim = {}
    for r in resultados:
        texto_eval = textos_map.get(r.textos_evaluacion_codigo_excel)
        if not texto_eval:
            continue
        r.texto_eval = texto_eval
        dim_nombre = texto_eval.dimension.nombre_dimension
        if dim_nombre not in resultados_por_dim:
            resultados_por_dim[dim_nombre] = []
        resultados_por_dim[dim_nombre].append(r)

    auto = Autoevaluacion.objects.filter(trabajador=trabajador, estado_finalizacion=True).first()
    jefe = EvaluacionJefatura.objects.filter(trabajador_evaluado=trabajador, estado_finalizacion=True).first()
    
    timestamp_auto = auto.momento_evaluacion.strftime("%d/%m/%Y %H:%M") if auto else "Pendiente"
    timestamp_jefe = jefe.momento_evaluacion.strftime("%d/%m/%Y %H:%M") if jefe else "N/A"
    
    buffer = BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=A4)
    elements = []
    
    styles = getSampleStyleSheet()
    title_style = ParagraphStyle(
        'CustomTitle',
        parent=styles['Heading1'],
        fontSize=18,
        textColor=colors.HexColor('#5e42a6'),
        spaceAfter=30,
        alignment=TA_CENTER
    )
    heading_style = ParagraphStyle(
        'CustomHeading',
        parent=styles['Heading2'],
        fontSize=14,
        textColor=colors.HexColor('#51ff85'),
        spaceAfter=12,
        spaceBefore=20
    )
    func_heading_style = ParagraphStyle(
        'FuncHeading',
        parent=heading_style,
        textColor=colors.HexColor('#2196F3')
    )
    comp_style = ParagraphStyle(
        'CompStyle',
        parent=styles['Normal'],
        fontSize=9,
        textColor=colors.HexColor('#51ff85'),
        fontName='Helvetica-Bold',
        spaceAfter=2,
    )
    comp_func_style = ParagraphStyle(
        'CompFuncStyle',
        parent=styles['Normal'],
        fontSize=9,
        textColor=colors.HexColor('#2196F3'),
        fontName='Helvetica-Bold',
        spaceAfter=2,
    )
    indicator_style = ParagraphStyle(
        'IndicatorStyle',
        parent=styles['Normal'],
        fontSize=7,
        textColor=colors.HexColor('#555555'),
        leading=9,
    )
    
    elements.append(Paragraph("Reporte de Evaluación de Desempeño", title_style))
    elements.append(Spacer(1, 0.2*inch))
    
    jefe_directo_nombre = f"{trabajador.id_jefe_directo.nombre} {trabajador.id_jefe_directo.apellido_paterno} {trabajador.id_jefe_directo.apellido_materno}" if trabajador.id_jefe_directo else "N/A"
    
    info_data = [
        ['Colaborador:', f"{trabajador.nombre} {trabajador.apellido_paterno} {trabajador.apellido_materno}"],
        ['Cargo:', trabajador.cargo.nombre_cargo],
        ['Nivel:', trabajador.nivel_jerarquico.nombre_nivel_jerarquico],
        ['Jefatura Directa:', jefe_directo_nombre],
        ['Autoevaluación finalizada:', timestamp_auto],
        ['Evaluación Jefatura finalizada:', timestamp_jefe]
    ]
    
    info_table = Table(info_data, colWidths=[2.5*inch, 4*inch])
    info_table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (0, -1), colors.HexColor('#f0f0f0')),
        ('TEXTCOLOR', (0, 0), (-1, -1), colors.black),
        ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
        ('FONTNAME', (0, 0), (0, -1), 'Helvetica-Bold'),
        ('FONTSIZE', (0, 0), (-1, -1), 10),
        ('BOTTOMPADDING', (0, 0), (-1, -1), 8),
        ('TOPPADDING', (0, 0), (-1, -1), 8),
        ('GRID', (0, 0), (-1, -1), 0.5, colors.grey)
    ]))
    
    elements.append(info_table)
    elements.append(Spacer(1, 0.3*inch))

    for dim_idx, (dim_nombre, lista) in enumerate(resultados_por_dim.items()):
        dim_heading = heading_style if dim_idx == 0 else func_heading_style
        dim_comp_style = comp_style if dim_idx == 0 else comp_func_style

        elements.append(Paragraph(f"Dimensión: {dim_nombre}", dim_heading))

        dim_data = [['Código', 'Competencia / Indicador', 'AutoEv', 'Ev. Jefe', 'Diferencia']]
        for r in lista:
            celda = [
                Paragraph(escape(r.texto_eval.competencia.nombre_competencia), dim_comp_style),
                Paragraph(escape(r.texto_eval.texto), indicator_style),
            ]
            dim_data.append([
                r.texto_eval.codigo_excel,
                celda,
                str(r.puntaje_autoev),
                str(r.puntaje_jefe) if r.puntaje_jefe > 0 else 'N/A',
                f"{'+' if r.diferencia > 0 else ''}{int(r.diferencia)}"
            ])

        dim_table = Table(dim_data, colWidths=[0.7*inch, 3.2*inch, 0.7*inch, 0.7*inch, 0.8*inch])
        dim_table.setStyle(TableStyle([
            ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor('#5e42a6')),
            ('TEXTCOLOR', (0, 0), (-1, 0), colors.white),
            ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
            ('ALIGN', (1, 0), (1, -1), 'LEFT'),
            ('VALIGN', (0, 0), (-1, -1), 'MIDDLE'),
            ('VALIGN', (1, 1), (1, -1), 'TOP'),
            ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
            ('FONTSIZE', (0, 0), (-1, 0), 10),
            ('FONTSIZE', (0, 1), (-1, -1), 9),
            ('BOTTOMPADDING', (0, 0), (-1, -1), 6),
            ('TOPPADDING', (0, 0), (-1, -1), 6),
            ('GRID', (0, 0), (-1, -1), 0.5, colors.grey)
        ]))

        elements.append(dim_table)
        elements.append(Spacer(1, 0.3*inch))
    
    doc.build(elements)
    
    pdf = buffer.getvalue()
    buffer.close()
    
    response = HttpResponse(pdf, content_type='application/pdf')
    response['Content-Disposition'] = f'inline; filename="reporte_{trabajador.nombre}_{trabajador.apellido_paterno}.pdf"'
    
    return response