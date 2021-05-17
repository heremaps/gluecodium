Gluecodium repository structure
===============================

This document describes most important directories in the structure of Gluecodium repository. Directory names are given
relative to the repository root directory.

Source code
-----------

Gluecodium main source code is split between three Gradle projects. The directory names are the same as the project
names. Each project contains its unit tests (but not functional tests, see `Functional tests` below). The source code
directories are: "gluecodium", "lime-loader", and "lime-runtime". For details on each Gradle project see
[Architecture](architecture.md).

Functional tests
----------------

"functional-tests" directory contains two functional test suites as well as the scripts that are used to run these.
* "functional-tests/functional" sub-directory contains the majority of functional tests for all four output languages.
* "functional-tests/namerules" sub-directory contains a small set of functional tests that test "custom name rules"
  functionality. There are tests for Java, Swift, and C++.
* "functional-tests/scripts" sub-directory contains Bash scripts that are used to run both suites of functional tests on
  CI. The same scripts can be used to execute the tests locally in a POSIX environment (see
  [Development tools](development_tools.md) for information on tools required for runnung tests locally).

Additional tools
----------------

The repository also contains additional tools designed to help with running Gluecodium:
* "cmake" directory contains CMake-based "toolchain", designed for using Gluecodium from CMake build scripts.
* "gluecodium-gradle" directory contains a Gradle plugin for using Gluecodium from Gradle build scripts.
* "tools" directory contains miscellaneous small tools:
  * a minimal "launcher" for running Gluecodium without downloading binaries or the whole repo manually.
  * a JAR file with IntelliJ IDEA settings for Gluecodium LIME IDL syntax highlighting (see
    [Tools read-me](../../tools/README.md) for usage instructions; see [LIME IDL](../lime_idl.md) for language
    documentation).
