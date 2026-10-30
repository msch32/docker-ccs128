#!/bin/bash

# Allow local X11 forwarding from Docker containers
xhost +local:docker

# Ensure the local host directory exists
mkdir -p "$HOME/ccs_container_data"

# Run the container, mapping the parent directory to /home/ti
docker run -it --rm \
  --net=host \
  --ipc=host \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  --device=/dev/bus/usb \
  -v "$HOME/ccs_container_data:/home/ti" \
  -v "$(pwd):/installer_folder" \
  ccs-ubuntu2204
