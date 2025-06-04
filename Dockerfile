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

RUN chmod +x ./entrypoint.sh

# Adicione seus aliases do ls -alF para ll ao .bashrc
RUN echo "alias ll='ls -alF'" >> /root/.bashrc

# ENTRYPOINT ["./entrypoint.sh"]
ENTRYPOINT ["sh", "./entrypoint.sh"]

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "setup.wsgi"]

EXPOSE 8000
