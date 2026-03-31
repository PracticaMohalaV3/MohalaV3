from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save 
from django.dispatch import receiver 

# =========================
# Tabla Empresa
# =========================
class Empresa(models.Model):
    id_empresa = models.AutoField(primary_key=True)
    nombre_empresa = models.CharField(max_length=100)
    rut_empresa = models.CharField(max_length=20, unique=True)
    empresa_activa = models.BooleanField(default=False)
    registrada_en = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = True
        db_table = 'empresa'

    def __str__(self):
        return f"{self.id_empresa} - {self.nombre_empresa} ({'Activa' if self.empresa_activa else 'Inactiva'})"


# ==========================================================
# Biblioteca
# ==========================================================
class Biblioteca(models.Model):
    id_biblioteca = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    archivo = models.BinaryField(editable=True)
    estado_carga = models.BooleanField(default=False)
    fecha_carga = models.DateTimeField(auto_now_add=True)
    empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'biblioteca'

    def __str__(self):
        return self.nombre

# ==========================================================
# Reporte Global
# ==========================================================
class ReporteGlobal(models.Model):
    id_reporte_global = models.AutoField(primary_key=True)
    contenido_pdf = models.BinaryField()
    timestamp = models.DateTimeField(auto_now_add=True)
    total_trabajadores = models.IntegerField(default=0)
    periodo = models.IntegerField(default=2026)
    empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'reporte_global'

    def __str__(self):
        return f"Reporte Global {self.id_reporte_global} - Periodo {self.periodo}"

# ==========================================================
#  Prompt Gemini
# ==========================================================
class PromptGemini(models.Model):
    id_prompt = models.AutoField(primary_key=True)
    prompt_texto = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)
    respuesta_gemini = models.TextField(null=True, blank=True)
    pdf_generado = models.BooleanField(default=False)
    archivo_pdf = models.BinaryField(null=True, blank=True)

    empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='empresa_id_empresa'
    )
    
    reporte_global = models.ForeignKey(
        ReporteGlobal,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='reporte_global_id'
    )

    class Meta:
        managed = True
        db_table = 'prompt_gemini'
        ordering = ['-timestamp']

    def __str__(self):
        return f"Prompt {self.id_prompt} - {self.timestamp.strftime('%d/%m/%Y')}"

# =========================
# Tabla Departamento
# =========================
class Departamento(models.Model):
    id_departamento = models.AutoField(primary_key=True)
    nombre_departamento = models.CharField(max_length=50)
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'departamento'
    
    def __str__(self):
        return f"{self.nombre_departamento} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"
    
# =========================
# Tabla Nivel Jerarquico
# =========================
class NivelJerarquico(models.Model):
    id_nivel_jerarquico = models.AutoField(primary_key=True)
    nombre_nivel_jerarquico = models.CharField(max_length=50)
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'nivel_jerarquico'

    def __str__(self):
        return f"{self.nombre_nivel_jerarquico} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"
    
# =========================
# Tabla Escala
# =========================
class Escala(models.Model):
    id_escala = models.AutoField(primary_key=True)
    valor = models.IntegerField()
    titulo = models.CharField(max_length=100)        
    descripcion = models.CharField(max_length=250)   
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'escala'

    def __str__(self):
        return f"{self.valor} - {self.titulo} - {self.descripcion} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"     

# =========================
# Tabla Dimension
# =========================
class Dimension(models.Model):
    id_dimension = models.AutoField(primary_key=True)
    nombre_dimension = models.CharField(max_length=50)
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'dimension'
    
    def __str__(self):
        return f"{self.nombre_dimension} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"

# =========================
# Tabla Competencia
# =========================
class Competencia(models.Model):
    id_competencia = models.AutoField(primary_key=True)
    nombre_competencia = models.CharField(max_length=50)
    dimension = models.ForeignKey(
        'Dimension', 
        on_delete=models.DO_NOTHING, 
        db_column='dimension_id_dimension'
    )
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )

    class Meta:
        managed = True
        db_table = 'competencia'
    
    def __str__(self):
        return f"{self.nombre_competencia} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"

# =========================
# Tabla Cargo
# =========================
class Cargo(models.Model):
    id_cargo = models.AutoField(primary_key=True)
    nombre_cargo = models.CharField(max_length=50)
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )
    nivel_jerarquico = models.ForeignKey(
        'NivelJerarquico', 
        on_delete=models.DO_NOTHING, 
        db_column='nivel_jerarquico_id_nivel_jerarquico'
    )

    class Meta:
        managed = True
        db_table = 'cargo'
    
    def __str__(self):
        return f"{self.nombre_cargo} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"

# =========================
# Tabla Textos Evaluación
# =========================
class TextosEvaluacion(models.Model):
    id_textos_evaluacion = models.AutoField(primary_key=True)
    codigo_excel = models.CharField(max_length=10)
    texto = models.TextField()
    empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='empresa_id_empresa'
    )
    dimension = models.ForeignKey(
        'Dimension',
        on_delete=models.DO_NOTHING,
        db_column='dimension_id_dimension'
    )
    competencia = models.ForeignKey(
        'Competencia',
        on_delete=models.DO_NOTHING,
        db_column='competencia_id_competencia'
    )
    nivel_jerarquico = models.ForeignKey(
        'NivelJerarquico',
        on_delete=models.DO_NOTHING,
        db_column='nivel_jerarquico_id_nivel_jerarquico'
    )

    class Meta:
        managed = True
        db_table = 'textos_evaluacion'
        unique_together = (('codigo_excel', 'empresa'),)

# =========================
# Tabla Código Evaluación
# =========================
class CodigoEvaluacion(models.Model):
    id_codigo_evaluacion = models.AutoField(primary_key=True)
    empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='empresa_id_empresa'
    )
    dimension = models.ForeignKey(
        'Dimension',
        on_delete=models.DO_NOTHING,
        db_column='dimension_id_dimension'
    )
    competencia = models.ForeignKey(
        'Competencia',
        on_delete=models.DO_NOTHING,
        db_column='competencia_id_competencia'
    )
    nivel_jerarquico = models.ForeignKey(
        'NivelJerarquico',
        on_delete=models.DO_NOTHING,
        db_column='nivel_jerarquico_id_nivel_jerarquico'
    )
    textos_evaluacion_codigo_excel = models.CharField(max_length=10)
    textos_evaluacion_empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='textos_evaluacion_empresa_id_empresa',
        related_name='codigos_evaluacion_textos'
    )

    class Meta:
        managed = True
        db_table = 'codigo_evaluacion'
        unique_together = (('empresa', 'textos_evaluacion_codigo_excel'),) 

# =========================
# Tabla Trabajador
# =========================
class Trabajador(models.Model):
    id_trabajador = models.AutoField(primary_key=True)
    rut = models.CharField(max_length=20, unique=True)
    id_jefe_directo = models.ForeignKey(
        'self', 
        on_delete=models.DO_NOTHING, 
        null=True, 
        blank=True, 
        related_name='subordinados',
        db_column='id_jefe_directo'
    )
    nombre = models.CharField(max_length=40)
    apellido_paterno = models.CharField(max_length=40)
    apellido_materno = models.CharField(max_length=40)
    email = models.CharField(max_length=80)
    genero = models.CharField(max_length=10)
    es_coordinador = models.BooleanField(default=False, db_column='es_coordinador')
    
    empresa = models.ForeignKey(
        'Empresa', 
        on_delete=models.DO_NOTHING, 
        db_column='empresa_id_empresa'
    )
    nivel_jerarquico = models.ForeignKey(
        'NivelJerarquico', 
        on_delete=models.DO_NOTHING, 
        db_column='nivel_jerarquico_id_nivel_jerarquico'
    )
    cargo = models.ForeignKey(
        'Cargo', 
        on_delete=models.DO_NOTHING, 
        db_column='cargo_id_cargo'
    )
    departamento = models.ForeignKey(
        'Departamento', 
        on_delete=models.DO_NOTHING, 
        db_column='departamento_id_departamento'
    )
    
    user = models.OneToOneField(
        User, 
        on_delete=models.SET_NULL, 
        null=True, 
        blank=True, 
        db_column='user_id'
    )

    class Meta:
        managed = True
        db_table = 'trabajador'

    @property
    def es_jefe(self):
        return self.subordinados.exists()
    
    def __str__(self):
        return f"{self.nombre} {self.apellido_paterno} | {self.rut} | ID {self.empresa.id_empresa} - {self.empresa.nombre_empresa}"

# =========================
# Tabla Autoevaluación
# =========================
class Autoevaluacion(models.Model):
    id_autoevaluacion = models.AutoField(primary_key=True)
    puntaje = models.IntegerField()
    fecha_evaluacion = models.DateField()
    momento_evaluacion = models.DateTimeField(auto_now_add=True)
    estado_finalizacion = models.BooleanField(default=False)
    comentario = models.TextField(null=True, blank=True)
    
    trabajador = models.ForeignKey(
        'Trabajador', 
        on_delete=models.DO_NOTHING, 
        db_column='trabajador_id_trabajador'
    )
    
    textos_evaluacion_codigo_excel = models.CharField(max_length=10)
    textos_evaluacion_empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='textos_evaluacion_empresa_id_empresa',
        related_name='autoevaluaciones_textos'
    )
    
    escala = models.ForeignKey(
        'Escala', 
        on_delete=models.DO_NOTHING, 
        db_column='escala_id_escala'
    )

    class Meta:
        managed = True
        db_table = 'autoevaluacion'

    def __str__(self):
        return f"Autoevaluación {self.id_autoevaluacion}"


# =========================
# Tabla Evaluación Jefatura
# =========================
class EvaluacionJefatura(models.Model):
    id_evaluacion_jefatura = models.AutoField(primary_key=True)
    puntaje = models.IntegerField()
    
    evaluador = models.ForeignKey(
        'Trabajador', 
        on_delete=models.DO_NOTHING, 
        db_column='evaluador_id_trabajador', 
        related_name='evaluaciones_como_jefe'
    )
    
    fecha_evaluacion = models.DateField()
    momento_evaluacion = models.DateTimeField(auto_now_add=True)
    estado_finalizacion = models.BooleanField(default=False)
    comentario = models.TextField(null=True, blank=True)
    
    trabajador_evaluado = models.ForeignKey(
        'Trabajador', 
        on_delete=models.DO_NOTHING, 
        db_column='trabajador_id_trabajador', 
        related_name='evaluaciones_recibidas'
    )
    
    textos_evaluacion_codigo_excel = models.CharField(max_length=10)
    textos_evaluacion_empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='textos_evaluacion_empresa_id_empresa',
        related_name='evaluaciones_jefatura_textos'
    )
    
    escala = models.ForeignKey(
        'Escala', 
        on_delete=models.DO_NOTHING, 
        db_column='escala_id_escala'
    )

    class Meta:
        managed = True
        db_table = 'evaluacion_jefatura'

    def __str__(self):
        return f"Evaluación {self.id_evaluacion_jefatura}"


# =========================
# Tabla Resultado Consolidado
# =========================
class ResultadoConsolidado(models.Model):
    id_resultado_consolidado = models.AutoField(primary_key=True)
    puntaje_autoev = models.IntegerField()
    puntaje_jefe = models.IntegerField()
    diferencia = models.IntegerField()
    periodo = models.IntegerField()
    
    trabajador = models.ForeignKey(
        'Trabajador', 
        on_delete=models.DO_NOTHING, 
        db_column='trabajador_id_trabajador'
    )
    autoevaluacion = models.ForeignKey(
        'Autoevaluacion',
        on_delete=models.DO_NOTHING,
        db_column='autoevaluacion_id_autoevaluacion'
    )
    evaluacion_jefatura = models.ForeignKey(
        'EvaluacionJefatura',
        on_delete=models.DO_NOTHING,
        null=True,
        blank=True,
        db_column='evaluacion_jefatura_id_evaluacion_jefatura'
    )
    textos_evaluacion_codigo_excel = models.CharField(max_length=10)
    textos_evaluacion_empresa = models.ForeignKey(
        'Empresa',
        on_delete=models.DO_NOTHING,
        db_column='textos_evaluacion_empresa_id_empresa',
        related_name='resultados_consolidados_textos'
    )

    class Meta:
        managed = True
        db_table = 'resultado_consolidado'
        unique_together = (('trabajador', 'textos_evaluacion_codigo_excel', 'periodo'),)

    def __str__(self):
        return f"Resultado {self.id_resultado_consolidado}"


# ==========================================================
# SIGNALS: Automatización de creación de usuarios para Login
# ==========================================================
@receiver(post_save, sender=Trabajador)
def crear_usuario_automatico(sender, instance, created, **kwargs):
    if created and not instance.user:
        nuevo_user = User.objects.create_user(
            username=instance.email,
            email=instance.email,
            password='Mohala2026'
        )
        instance.user = nuevo_user
        instance.save()