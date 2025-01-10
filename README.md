# vsserver-docker
Vintage Story dockerized with support for ExpandedLogs and Temporalog, also with exposed livemap.

https://mods.vintagestory.at/temporalog
https://mods.vintagestory.at/explogs
https://mods.vintagestory.at/livemap

# Usage
First of all, you should know what are you doing and that my scripts are not perfect :P

On your machine you need to have installed `docker` and `docker-compose` and ofc have root access.

Clone this repo and `cd` into it.

For first time usage use the instructions below, so build our custom vsserver docker image first. 

```
sudo docker-compose build
```

Than you can run

```
sudo docker-compose up -d & sudo chown -R $USER data/
```

It should create needed volumes and files for VS and other services, all in `data` directory, also it's gonna give onwership of the files to your user, so you're not gonna have issues with editing config files and adding mods etc.. 

# Scripts

Start by making them executable

```
sudo chmod -x start.sh & sudo chmod -x stop.sh
```

And then you can start/stop server and other services with those two simple scripts.

# Configs

When you gonna use LiveMap adjust the port in the config in the `ModConfig\livemap.json` to `42069` or change to something else, but remember to adjust the exposed port in `compose.yml` for vsserver service.

