#!/bin/bash
# This script compiles the java source files in the examples directory and compiles them into a native-image.

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

# Run tests in container
docker run \
	--rm \
	-it \
	-v $(pwd)/tests:/tmp/ \
	${DOCKER_IMAGE} /bin/bash /tmp/tests.sh
