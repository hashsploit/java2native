#!/bin/bash
# This "AoT compiles" a Java class file or Jar file to a native-image using GraalVM inside a Docker container.
# Edit the "settings.sh" file instead.
# Written by hashsploit.

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
	echo -e "Docker image ${DOCKER_IMAGE} not found, building it ..."
	docker build --build-arg GRAALVM_SOURCE="${GRAALVM_SOURCE}" --tag ${DOCKER_IMAGE} .
fi


# Check if this script has the "stop-after-docker-image-install" flag is set
if [ "$1" == "stop-after-docker-image-install" ]; then
	exit 0
fi


# Bind the current directory and use native-image to compile the java class/jar input to output linux binary
docker run \
	--rm \
	-it \
	-v $(pwd):/tmp/ \
	-e NI_ARGS=${NI_ARGS} \
	-e GRAALVM_SOURCE=${GRAALVM_SOURCE} \
	${DOCKER_IMAGE} native-image ${NI_MODE} /tmp/${INPUT_FILE} /tmp/${OUTPUT_BINARY} ${NI_ARGS}

