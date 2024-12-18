# Image de base
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application
COPY . .

# Commande par défaut pour exécuter l'application
CMD ["python", "app/app.py"]
