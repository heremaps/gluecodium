## Overview

[README.md](../README.md) in the root provides basic information about Gluecodium.
It's simplier to keep C++ code in shared library when binding is necessary for Java and for Swift.
In examples simpliest configuration is used. For more advanced check `cmake/tests/unit` tests.

## CMake Gluecodium wraper.

This is set of cmake functions which provide the following functionality:
- Download Gluecodium from artifactory.
- Add step to generate code.
- Set options to configure generated code.
- Help to configure a target to include generated C++/Swift/Java/Flutter sources, add include directories, etc.

While examples work with shipped CMake Gluecodium wraper in real application it's handy to clone only subtree `cmake/modules`.

## Example `calculator`.

What this example demonstrates:
- How to configure the project to generate C++, Java and Swift source code.
- How to use the generated code in Android and iOS applications.
- How to describe basic primitives like `class`, `interface`, `struct` and how to interact with them 
- How to make platform-only comment and links.

What this example DOESN'T demonstrate:
- How to make complex build setup with several modules.
- How to describe custom types.
- How to make Flutter plugin.
- How to use advanced Gluecodium features: tags, advanced manupulations with comments, properties, etc.

For detailed desription check [calculator/README.md](calculator/README.md)
