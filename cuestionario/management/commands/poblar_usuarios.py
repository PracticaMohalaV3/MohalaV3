from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from cuestionario.models import Trabajador

def get_password_por_empresa(trabajador):
    passwords = {
        1: 'Mohala2026',
        2: 'Permify2026',
        3: 'Redgroup2026',
        #ir agregando aqui las nuevas pass que se quieran ir asignando a nuevas empresas
        #si son pobladas a través del poblador web tendrán por defecto Mohala2026
    }
    return passwords.get(trabajador.empresa_id, 'DefaultPass2026')

class Command(BaseCommand):
    help = 'Crea y vincula usuarios de Django para trabajadores'

    def handle(self, *args, **kwargs):
        self.stdout.write('Iniciando vinculación de usuarios...')
        
        trabajadores = Trabajador.objects.all()
        
        contador = 0
        for t in trabajadores:
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
            
            if not t.user:
                t.user = user
                t.save()
            
            self.stdout.write(self.style.SUCCESS(f"✅ {t.email} → empresa {t.empresa_id} → password actualizada"))
            contador += 1

        self.stdout.write(self.style.SUCCESS(f'--- Proceso finalizado. {contador} usuarios actualizados ---'))