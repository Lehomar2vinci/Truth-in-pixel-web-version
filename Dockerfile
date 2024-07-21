FROM python:3.9-slim

# Créer un utilisateur non root
RUN adduser --disabled-password --gecos '' appuser
USER appuser

WORKDIR /app

# Mettre à jour pip
RUN pip install --upgrade pip

# Installer Flask et ses dépendances
RUN pip install Flask==2.0.1

# Installer OpenCV et ses dépendances
RUN pip install opencv-python==4.10.0.84

# Installer MediaPipe et ses dépendances
RUN pip install mediapipe==0.10.14

# Installer Parse et ses dépendances
RUN pip install parse==1.20.1

# Installer les autres dépendances par petits lots
RUN pip install numpy==2.0.0 scipy==1.13.1 matplotlib==3.9.1
RUN pip install pillow==10.4.0

COPY . .

CMD ["python", "app.py"]
