## Minecraft Forge Docker Image (No Official)

> [!NOTE]
> This is using [Amazon Corretto 21](https://hub.docker.com/_/amazoncorretto) base image.

How to run:

Set your world (if any), mods and config folders, use those routes for volumes. Set this before you create your world.

Commands Assuming I want my mods, config and world folders in the current directory
For windows:

```shell
docker run -d -p 25565:25565 -v  ${PWD}/mods:/minecraft/mods -v  ${PWD}/config:/minecraft/config -v  ${PWD}/world:/minecraft/world --name forge-server cairoatcode/minecraft-forge:tag
```

For Linux/MacOS:

```shell
docker run -d -p 25565:25565 \
       -v  $(pwd)/mods:/minecraft/mods \
       -v  $(pwd)/config:/minecraft/config \
       -v  $(pwd)/world:/minecraft/world \
       --name forge-server cairoatcode/minecraft-forge:tag
```

If you want to change the Minecraft Forge version, you can do next command:

```shell

    docker build --build-arg FORGE_URL=**ROUTETOFORGE** -t minecraft-forge-server .

```

I'm not supporting any Minecraft, Forge or mod code, just wanted to set a server with my friends and don't want to do it again. If you need you can change things, the code is in this repo https://github.com/ErsoSkywalker/MinecraftForgeDockerImage
