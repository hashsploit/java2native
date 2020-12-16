#!/bin/bash
# This script runs native-image from within the container with cli parameters as arguments.

source ./settings.sh

# Set the directory to this script's current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR


# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo -e "$(tput bold)$(tput setaf 1)Docker is not installed, please install Docker!$(tput sgr0)"
    exit 1
fi

# Check if docker image are already build, if not, build it.
if [[ "$(docker images -q ${DOCKER_IMAGE} 2>/dev/null)" == "" ]]; then
	./compile.sh stop-after-docker-image-install
fi

# Execute native-image in the container
docker run \
	--rm \
	-it \
	-v $(pwd)/tests:/tmp/ \
	-e GRAALVM_SOURCE=${GRAALVM_SOURCE} \
	${DOCKER_IMAGE} native-image $@
