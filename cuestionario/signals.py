from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from cuestionario.models import Trabajador

def get_password_por_empresa(trabajador):
    passwords = {
        1: 'Mohala2026',
        2: 'Permify2026',
    }
    return passwords.get(trabajador.empresa_id, 'DefaultPass2026')

class Command(BaseCommand):
    help = 'Crea y vincula usuarios de Django para trabajadores'

    def handle(self, *args, **kwargs):
        self.stdout.write('Iniciando vinculación de usuarios...')
        trabajadores_sin_user = Trabajador.objects.filter(user__isnull=True)
        
        contador = 0
        for t in trabajadores_sin_user:
            password = get_password_por_empresa(t)
            
            user, created = User.objects.get_or_create(
                username=t.email,
                defaults={
                    'email': t.email, 
                    'first_name': t.nombre,
                    'last_name': f"{t.apellido_paterno} {t.apellido_materno}",
                    'is_staff': False
                }
            )
            
            user.first_name = t.nombre
            user.last_name = f"{t.apellido_paterno} {t.apellido_materno}"
            user.set_password(password)
            user.is_staff = False 
            user.save()
            
            t.user = user
            t.save()
            
            self.stdout.write(self.style.SUCCESS(f"✅ Usuario procesado: {t.email} (empresa {t.empresa_id})"))
            contador += 1

        self.stdout.write(self.style.SUCCESS(f'--- Proceso finalizado. {contador} usuarios listos ---'))