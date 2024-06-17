# Utiliser une image de base appropriée
FROM ubuntu:20.04

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    fuse \
    libfuse2 \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Télécharger le fichier .AppImage depuis GitHub
RUN wget -O /app/glpi-agent-1.9-x86_64.AppImage https://github.com/glpi-project/glpi-agent/releases/download/1.9/glpi-agent-1.9-x86_64.AppImage

# Rendre le fichier .AppImage exécutable
RUN chmod +x /app/glpi-agent-1.9-x86_64.AppImage

# Commande pour maintenir le conteneur actif
CMD ["tail", "-f", "/dev/null"]
