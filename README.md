# Java2Native

This project uses a containerized GraalVM native-image to "compile" a jar file to a native linux ELF binary.

Edit `settings.sh` to modify the `input` class/jar file and `output` binary file names and to add additional native-image arguments.

## How to run

Simply run `./compile.sh` and it will take the settings configured in `settings.sh` and it will attempt to compile your java class/jar file into a native linux elf binary.

## GraalVM native-image usage

```
Usage: native-image [options] class [imagename] [options]
           (to build an image for a class)
   or  native-image [options] -jar jarfile [imagename] [options]
           (to build an image for a jar file)
where options include:
    -cp <class search path of directories and zip/jar files>
    -classpath <class search path of directories and zip/jar files>
    --class-path <class search path of directories and zip/jar files>
                          A : separated list of directories, JAR archives,
                          and ZIP archives to search for class files.
    -D<name>=<value>      set a system property
    -J<flag>              pass <flag> directly to the JVM running the image generator
    -O<level>             0 - no optimizations, 1 - basic optimizations (default).
    --verbose             enable verbose output
    --version             print product version and exit
    --help                print this help message
    --help-extra          print help on non-standard options

    --allow-incomplete-classpath
                          allow image building with an incomplete class path: report type
                          resolution errors at run time when they are accessed the first
                          time, instead of during image building
    --auto-fallback       build stand-alone image if possible
    --enable-all-security-services
                          add all security service classes to the generated image.
    --enable-http         enable http support in the generated image
    --enable-https        enable https support in the generated image
    --enable-url-protocols
                          list of comma separated URL protocols to enable.
    --features            a comma-separated list of fully qualified Feature implementation
                          classes
    --force-fallback      force building of fallback image
    --initialize-at-build-time
                          a comma-separated list of packages and classes (and implicitly all
                          of their superclasses) that are initialized during image
                          generation. An empty string designates all packages.
    --initialize-at-run-time
                          a comma-separated list of packages and classes (and implicitly all
                          of their subclasses) that must be initialized at runtime and not
                          during image building. An empty string is currently not
                          supported.
    --install-exit-handlers
                          provide java.lang.Terminator exit handlers for executable images
    --libc                selects the libc implementation to use. Available implementations:
                          glibc, musl
    --native-compiler-options
                          provide custom C compiler option used for query code compilation.
    --native-compiler-path
                          provide custom path to C compiler used for query code compilation
                          and linking.
    --native-image-info   show native-toolchain information and image-build settings
    --no-fallback         build stand-alone image or report failure
    --report-unsupported-elements-at-runtime
                          report usage of unsupported methods and fields at run time when
                          they are accessed the first time, instead of as an error during
                          image building
    --shared              build shared library
    --static              build statically linked executable (requires static libc and zlib)
    --trace-class-initialization
                          comma-separated list of fully-qualified class names that class
                          initialization is traced for.
    --trace-object-instantiation
                          comma-separated list of fully-qualified class names that object
                          instantiation is traced for.
    -da                   also -da[:[packagename]...|:classname] or
                          -disableassertions[:[packagename]...|:classname]. Disable
                          assertions with specified granularity.
    -dsa                  also -disablesystemassertions. Disables assertions in all system
                          classes.
    -ea                   also -ea[:[packagename]...|:classname] or
                          -enableassertions[:[packagename]...|:classname]. Enable
                          assertions with specified granularity.
    -esa                  also -enablesystemassertions. Enables assertions in all system
                          classes.
    -g                    generate debugging information
```
