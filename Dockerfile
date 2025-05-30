FROM python:3.11

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
COPY requirements-dev.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt

# Atualiza os pacotes e instala o htop e make
RUN apt update && \
    apt install -y htop make && \
    rm -rf /var/lib/apt/lists/*

COPY . .

# Adicione seus aliases do ls -alF para ll ao .bashrc
RUN echo "alias ll='ls -alF'" >> /root/.bashrc

# Defina o comando padrão (opcional)
CMD ["bash"]

# # Expõe a porta em que o Gunicorn vai rodar (padrão do Django)
# EXPOSE 8000

# # Comando para iniciar a aplicação usando Gunicorn
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "setup.wsgi"]
