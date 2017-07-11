# API Transpiler Hello World project
Serves as a working prototype used to showcase and extend the API transpiler.
The project is structured as follows:

    .
    ├── platforms           Example apps using transpiled sources and functional tests
    │   ├── android         Android related projects
    │   │   ├── app         Android example app
    │   │   └── test        Functional tests for generated Android library
    │   ├── base_api        C++ example app
    │   └── ios             iOS example app
    ├── cmake
    │   └── modules         Custom CMake modules, includes Transpiler.cmake
    ├── libhello            Example library that provides transpiler-generated public API
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
git review --reviewers \
    abdessamad.elkasimi@here.com \
    alexander.lehmann@here.com \
    daniel.kamkha@here.com \
    dario.limongi@here.com \
    eva.effertz@here.com \
    francisco.cortes@here.com \
    georg.bremer@here.com \
    manuel.klahn@here.com \
    rafal.parzych@here.com \
    sascha.ebel@here.com \
    sascha.peilicke@here.com \
    sayuri.oshima@here.com \
    teemu.kahkonen@here.com \
    master
```

Or, just:

```bash
git push origin HEAD:refs/for/master
```

And add the *TranspilerReviewers* group manually on Gerrit's web interface.


## License
    Copyright 2017 HERE Europe B.V.

    This software and other materials contain proprietary information of HERE
    and are protected by applicable copyright legislation. Any use and
    utilization of this software and other materials and disclosure to any
    third parties is conditional upon having a separate agreement with HERE
    for the use, utilization or disclosure of this software. In the absence of
    such agreement, the use of the software is not allowed.
