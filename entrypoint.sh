#!/bin/sh

# Espera o banco de dados estar disponível.
# Você pode usar 'command' ou 'wait-for-it.sh' para isso, mas um sleep simples é um começo.
sleep 5

# Aplica as migrations do Django
echo "Aplicando migrations..."
python manage.py migrate --noinput

# Coleta os arquivos estáticos
echo "Coletando arquivos estáticos..."
python manage.py collectstatic --noinput

# Opcional: Cria o superusuário se não existir
echo "Criando superusuário..."
python create_superuser.py

# Executa o comando principal do container (que virá do CMD ou docker-compose command)
exec "$@"
