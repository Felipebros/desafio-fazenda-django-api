import os
import django
from django.contrib.auth import get_user_model

# Configura o ambiente Django
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "setup.settings")
django.setup()

User = get_user_model()

username = os.environ.get("DJANGO_SUPERUSER_USERNAME", "admin")
email = os.environ.get("DJANGO_SUPERUSER_EMAIL", "admin@example.com")
password = os.environ.get(
    "DJANGO_SUPERUSER_PASSWORD", "admin"
)  # ALTERE ESTA SENHA PARA ALGO SEGURO EM PRODUÇÃO!

if not User.objects.filter(username=username).exists():
    print(f"Creating superuser {username}...")
    User.objects.create_superuser(username, email, password)
    print("Superuser created successfully.")
else:
    print(f"Superuser {username} already exists.")
