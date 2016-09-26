# ZSH-Docker

This is a zsh-docker project to build docker images with multiple zsh versions
for integrating with TravisCI for Antigen's continuos integration pipeline.

Image is currently available via DockerHub, see Usage section.

# Usage

  docker pull desyncr/antigen-docker

# ZSH versions
  - master
  - 5.2
  - 5.1
  - 5.0.0
  - 4.3.17
  - 4.3.5

# Usage

    docker run --privileged=true -v /path/to/antigen:/usr/share/antigen -it desyncr/antigen-docker /bin/sh -c "./run.sh"

# TODO

  - Install python and pip (dev dependencies)

