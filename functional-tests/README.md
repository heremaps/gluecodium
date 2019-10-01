Functional tests for Gluecodium
===========================

The functional tests are separated by Gluecodium settings. Gluecodium provides various options which result
in different generated code for the same input LIME definition files. In order to test these
properly, different test binaries will be generated.

Stucture
--------

    featuretype
    ├── android             Optional Android implementation and tests
    ├── swift               Optional Swift implementation and tests
    ├── cpp                 C++ implementation and tests
    └── input               Input files
