#!/bin/bash

# Jar file name to be compiled.
INPUT_FILE="input.jar"

# Output binary name
OUTPUT_BINARY="output"

# Additional GraalVM native-image arguments
NI_ARGS="-jar"

# Docker image name
DOCKER_IMAGE="java2native"

# GraalVM download source
GRAALVM_SOURCE="https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-20.3.0/graalvm-ce-java11-linux-amd64-20.3.0.tar.gz"

