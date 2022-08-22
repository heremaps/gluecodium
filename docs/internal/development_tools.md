Gluecodium project development tools
====================================

This document describes the tools necessary and/or recommended for developing Gluecodium.

Required tools for Gluecodium itself
------------------------------------

* [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) - for downloading Gluecodium repository source
  code and for committing the changes to the repository.
* [Java JDK](https://openjdk.java.net/install/index.html) - for running Gluecodium itself, as well as its unit and
  integration tests. Java 11 is guaranteed to work, regardless of the JDK vendor. Any version above that may or may not
  have issues.

Required tools for Gluecodium functional tests
----------------------------------------------

* [Java JDK](https://openjdk.java.net/install/index.html) - for running Gluecodium itself (see above).
* [CMake](https://cmake.org/install/) - minimum required CMake version is 3.19.3.
* [ninja](https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages)
* [Android SDK](https://developer.android.com/about/versions/11/setup-sdk) - required for running Android functional
  tests. Can be installed either through *Android Studio* or through the command line. For command line installation
  instructions see "Install Android SDK" section in 
  [GitHub Actions CI config](../../.github/workflows/functional-tests.yml).
* [Swift SDK](https://swift.org/download/#releases) - required for running Swift functional tests.
* [Dart SDK](https://dart.dev/get-dart) - required for running Dart functional tests. For running Dart tests without
  memory checks a pre-built Dart SDK binary is sufficient. For running them with memory checks, the Dart SDK needs to be
  built from source with "tcmalloc" library disabled. See "Compile Dart SDK without tcmalloc" section in
  [GitHub Actions CI config](../../.github/workflows/functional-tests.yml) for instructions.

Recommended tools
-----------------

* An IDE with Kotlin support is highly recommended for editing and debugging Gluecodium itself. The repository contains
  a project config for [IntelliJ IDEA](https://www.jetbrains.com/idea/download/). There are also syntax highlighters
  available for "IntelliJ IDEA" (see "tools" directory in the repository) and for
  [Sublime](https://github.com/Hsilgos/GluecodiumSyntax) editor.
* [valgrind](https://www.valgrind.org/) - memory checking tool used with C++ and Swift functional tests. While it is
  possible to run these tests without valgrind, it is highly recommended running the tests with memory checks.
