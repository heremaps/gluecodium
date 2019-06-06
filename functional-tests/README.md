Functional tests for Genium
===========================

The functional tests are separated by Genium settings. Genium provides various options which result
in different generated code for the same input FIDL definition files. In order to test these
properly, different test binaries will be generated.

Stucture
--------

    featuretype
    ├── android             Optional Android implementation and tests
    ├── swift               Optional Swift implementation and tests
    ├── cpp                 C++ implementation and tests
    └── input               Input files
