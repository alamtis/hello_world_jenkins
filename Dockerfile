# Image de base
FROM python:3.9-slim

# Installer les dépendances nécessaires pour Docker et autres outils
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update && apt-get install -y docker-ce-cli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de l'application
COPY . .

# Commande par défaut pour exécuter l'application
CMD ["python", "app/app.py"]
