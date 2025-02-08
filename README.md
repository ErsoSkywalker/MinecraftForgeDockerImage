## Minecraft Forge Docker Image

Is pending to define the volumes for mods and config folders.
How to run:

```shell

#For building the Image
docker build -t minecraft-forge .

#For windows:
docker run -d -p 25565:25565 -v ${PWD}/world:/minecraft/world --name forge-server minecraft-forge

#For Linux/MacOS:
docker run -d -p 25565:25565 -v $(pwd)/world:/minecraft/world --name forge-server minecraft-forge

# This is expecting to have the world folder in your current directory, so you can save your progress.

```

I'm not supporting any Forge or mod code , just wanted to set a server with my friends and don't want to do it again. If you need you can change the Forge version in Dockerfile.
