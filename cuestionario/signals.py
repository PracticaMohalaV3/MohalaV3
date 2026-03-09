from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save 
from django.dispatch import receiver
from cuestionario.models import Trabajador 

def get_password_por_empresa(trabajador):
    passwords = {
        1: 'Mohala2026',
        2: 'Permify2026',
    }
    return passwords.get(trabajador.empresa_id, 'DefaultPass2026')

@receiver(post_save, sender=Trabajador)
def crear_usuario_automatico(sender, instance, created, **kwargs):
    if created and not instance.user:
        password = get_password_por_empresa(instance)
        
        nuevo_user = User.objects.create_user(
            username=instance.email,
            email=instance.email,
            password=password
        )
        instance.user = nuevo_user
        instance.save()