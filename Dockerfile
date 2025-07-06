# Imagem base oficial do Python
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia os arquivos de dependências (se houver)
COPY requirements.txt .

# Instala as dependências da aplicação
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código da aplicação para o container
COPY . .

# Expõe a porta que o FastAPI vai rodar (uvicorn)
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

# Executar- docker run -p 8000:8000 api