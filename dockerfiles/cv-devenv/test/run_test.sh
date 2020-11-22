#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# echo $DIR

CMD="bash"

# User
# xhost +
# docker run --name cv-devenv \
#     --net=host --ipc=host \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     --gpus all \
#     -it \
#     --entrypoint /bin/bash \
#     --rm \
#     -u $(id -u):$(id -g) \
#     -p 8081:8888 \
#     -p 6006:6006 \
#     -p 6007:6007 \
#     -p 5000:5000 \
#     -v "$DIR":/work \
#     loicboisson/computer-vision_devenv \
#     -c "source /etc/bash.bashrc && cd /work && $CMD" \
#     /

# Sudo
xhost +
docker run --name cv-devenv \
    --net=host --ipc=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --gpus all \
    -it \
    -d \
    --entrypoint /bin/bash \
    --rm \
    -p 8081:8888 \
    -p 6006:6006 \
    -p 6007:6007 \
    -p 5000:5000 \
    -v "$DIR":/work \
    loicboisson/computer-vision_devenv \
    -c "source /etc/bash.bashrc && cd /work && $CMD" \
    /

# docker run --name cv-devenv \
#     --gpus all \
#     -it \
#     --entrypoint /bin/bash \
#     --rm \
#     -u $(id -u):$(id -g) \
#     -p 8081:8888 \
#     -p 6006:6006 \
#     -p 6007:6007 \
#     -p 5000:5000 \
#     -v "$DIR":/work \
#     loicboisson/computer-vision_devenv \
#     -c "source /etc/bash.bashrc && cd /work && $CMD" \
#     /

# docker run --name cv-devenv \
#     --gpus all \
#     -it \
#     --entrypoint /bin/bash \
#     --rm \
#     -p 8081:8888 \
#     -p 6006:6006 \
#     -p 6007:6007 \
#     -p 5000:5000 \
#     -v "$DIR":/work \
#     loicboisson/computer-vision_devenv \
#     -c "source /etc/bash.bashrc && cd /work && $CMD" \
#     /