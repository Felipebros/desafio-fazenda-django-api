# desafio-fazenda-django-api

Este repositório contém um desafio para uma vaga de trabalho.

Trata-se de um sistema para controle de produtores rurais e fazendas,
desenvolvido de acordo com os requisitos descritos neste link https://github.com/brain-ag/trabalhe-conosco/tree/a6e2b535807db3475843ea2b0b4a50bb8a99a1fb

## Para executar pelo docker
### Crie o arquivo `.env`
Copie o arquivo `.env.example` e renomei para `.env`

### Para fazer o build e executar
```bash
make build
```

### Parar a execução
```bash
make stop
```

### Para executar
```bash
make up
```

### Para acessar o bash
```bash
make bash
```

## Para desenvolver novas funcionalidades do projeto
### Para executar durante o desenvolvimento
1. Copie o arquivo `.env.example` e renomei para `.env`
2. Descomente a linha abaixo, e comente a outra linha que contém DB_HOST
```env
DB_HOST=127.0.0.1 # via uv run
```
```bash
make buildbd
```
ou
```bash
docker-compose up --build -d my_postgres_db
```
3. Execute o comando abaixo para executar o projeto
```bash
make rundev
```
ou
```bash
uv run manage.py runserver
```
ou
```bash
make rundev2
```
ou
```bash
uv run gunicorn --bind 0.0.0.0:8000 setup.wsgi
```

### Para gerar os arquivos de traduções
```bash
uv run manage.py makemessages -l pt_BR
```
```bash
uv run manage.py compilemessages
```
