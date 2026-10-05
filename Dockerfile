# Imagen base oficial con soporte para agentes remotos de OpenCode Go
FROM jks15satoshi/opencode-container:master

USER root
RUN apt-get update && apt-get install -y curl git build-essential && apt-get clean

# El puerto estándar por el que SnapDeploy enrutará el tráfico HTTPS público
EXPOSE 8080

# Iniciamos el agente en modo "worker" de OpenCode escuchando las directrices externas
ENTRYPOINT ["opencode", "agent-worker", "--port", "8080", "--secret", "${AMP_ORB_SECRET}"]
