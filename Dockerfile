# Utilisez une image Debian comme base
FROM ubuntu:latest

# Update system packages
RUN apt-get update && apt-get upgrade -y

# Installe les dépendances nécessaires (curl, tar, et autres outils requis)
RUN apt-get install -y --no-install-recommends wget ca-certificates openjdk-17-jre && \
    rm -rf /var/lib/apt/lists/*

# Télécharge la dernière version de Keycloak depuis le site officiel
RUN wget -O keycloak.tar.gz  https://github.com/keycloak/keycloak/releases/download/21.0.0/keycloak-21.0.0.tar.gz && \
tar xzf keycloak.tar.gz -C /opt/ && \
rm keycloak.tar.gz

# Point d'entrée pour l'exécution de Keycloak
CMD ["/opt/keycloak-21.0.0/bin/kc.sh", "start-dev", "--http-port", "80"]

