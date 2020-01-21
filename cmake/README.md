# Gluecodium CMake toolchain

This project provides CMake functions to simplify using Gluecodium in CMake-based
projects.

## Generate code

The modules consist of a platform independent part in `modules/gluecodium/gluecodium`
and platform specific helpers. To generate code for a target the functions
`apigen_generate`, `apigen_target_sources` and `apigen_target_include_directories`
should be called for that target.
Depending on the target platform, there are helpers for creating `.aar` archives for
Android and Swift `.framework` for iOS or macOS.
For more details check out the [Examples](../examples/README.md).

## Source sets

Gluecodium distinguishes between two different source sets, "main" and "common". "Main"
code depends on the input Lime IDL files while "common" code only depends on the
Gluecodium options like internal namespace etc. In most use cases where there is only one
target with generated code, not setting a common code directory works just fine, it will
then be combined with the main code and can be used like this.

If code is generated for more than one target and should be used together, then the
common code needs to be separated as it would otherwise be duplicated and cause
compilation issues. For this a separate common output directory must be set for
`apigen_generate` and the generated common source only added to one target which all
others link against. `add_target_sources` and `add_target_link_directories` support
"MAIN" and "COMMON" options for this use case.

## Lime IDL file dependencies between targets

If a target A's Lime IDL files depend on those from target B, then these need to
be passed to Gluecodium during generation of A. To do this without generating B's
code twice and having duplicate symbols, Gluecodium supports auxiliary Lime IDL
input which will not result in generated files. To simplify usage of this feature,
`apigen_generate` will pass all target `SOURCES` and `INTERFACE_SOURCES` as
auxiliary sources to Gluecodium. Since `INTERFACE_SOURCES` is resolved
transitively by CMake this means these can be passed automatically when:

    * target B adds its Lime IDL files as `INTERFACE_SOURCES`: `target_sources(B INTERFACE b1.lime b2.lime...)`
    * target A links to B public: `target_link_libraries(A PUBLIC B)`

In this case also transitive Lime IDL dependencies are resolved by CMake.
