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
       ├── build-cpp        Builds the entire project for C++ customers
       ├── build-android    Builds the entire project for Android customers
       └── build-swift      Builds the entire project for Swift customers


## Building and testing
Invoke the following script to build the entire project for C++ customers:

```bash
./scripts/build-cpp
```

Install artifacts end up in the dist/ folder and are ready for re-distribution.

## Contributing
Work on your stuff locally, branch, commit and modify to your heart's content.
As soon as you're ready either do (assuming you have git-review installed):

```bash
git review -R
```

Or, just:

```bash
git push origin HEAD:refs/for/master
```
