#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

# Compile source files into java byte-code IL.
javac *.java

# Build jar file from .class files
jar -cvfm test.jar manifest.txt *.class

# Compile a native-image from the jar file
native-image -jar test.jar test_binary

chmod 777 -R .

echo -e "==== RUNNING TESTS ===="

# Test JVM
echo -e "JVM: "
time java -jar test.jar 2>&1 >/dev/null

# Test SVM
echo -e "SVM: "
time ./test_binary 2>&1 >/dev/null

