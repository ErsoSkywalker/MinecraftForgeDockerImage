FROM amazoncorretto:17

WORKDIR /minecraft

COPY eula.txt /minecraft
COPY /config /minecraft/config
COPY /mods /minecraft/mods

RUN yum install -y wget && yum clean all

RUN wget -O forge-installer.jar "https://maven.minecraftforge.net/net/minecraftforge/forge/1.20.1-47.3.0/forge-1.20.1-47.3.0-installer.jar"

# Install Forge
RUN java -jar /minecraft/forge-installer.jar --installServer

VOLUME /minecraft/world

# Expose Minecraft server port
EXPOSE 25565

# Set entrypoint to start the Forge server
CMD ["sh", "run.sh"]