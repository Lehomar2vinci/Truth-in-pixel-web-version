FROM python:3.9-slim

# Créer un user non root
RUN adduser --disabled-password --gecos '' appuser
USER appuser

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
