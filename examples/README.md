# Genium Hello World project
Serves as a working prototype used to showcase the Genium tool.
The project is structured as follows:

    .
    ├── platforms           Example apps using generated sources and functional tests
    │   ├── android         Android related projects
    │   │   ├── app         Android example app
    │   │   └── test        Functional tests for generated Android library
    │   ├── base_api        C++ example app
    │   └── ios             iOS example app
    ├── cmake
    │   └── modules         Custom CMake modules, includes Genium.cmake
    ├── libhello            Example library that provides Genium-generated public API
    │   ├── fidl            Franca interface definitions for the public API
    │   └── src             Example library implementation
    └── scripts             Usefule scripts
       ├── build-cpp        Builds the entire project for C++ users
       ├── build-android    Builds the entire project for Android users
       └── build-swift      Builds the entire project for Swift users


## Building and testing
Invoke the following script to build the entire project for C++ users:

```bash
./scripts/build-cpp
```

Install artifacts end up in the dist/ folder and are ready for re-distribution.
