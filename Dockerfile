FROM python:3.9-slim

# Créer un utilisateur non root
RUN adduser --disabled-password --gecos '' appuser
USER appuser

WORKDIR /app

# Mettre à jour pip et installer les dépendances par étapes pour réduire la mémoire utilisée
RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install Flask==2.0.1
RUN pip install opencv-python==4.10.0.84
RUN pip install mediapipe==0.10.14
RUN pip install parse==1.20.1

COPY . .

CMD ["python", "app.py"]
