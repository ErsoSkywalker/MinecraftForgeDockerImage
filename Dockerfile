FROM amazoncorretto:21

ARG FORGE_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.3.0/forge-1.20.1-47.3.0-installer.jar"

WORKDIR /minecraft

COPY eula.txt /minecraft

RUN yum install -y wget && yum clean all

RUN wget -O forge-installer.jar ${FORGE_URL}

# Install Forge
RUN java -jar /minecraft/forge-installer.jar --installServer

VOLUME /minecraft/world

# Set first the mods, then run the container.
VOLUME /minecraft/config
VOLUME /minecraft/mods

# Expose Minecraft server port
EXPOSE 25565

# Set entrypoint to start the Forge server
CMD ["sh", "run.sh"]