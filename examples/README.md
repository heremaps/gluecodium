# Gluecodium Hello World project

Serves as a working prototype used to showcase the Gluecodium tool.
The project is structured as follows:

    .
    ├── platforms           Example apps using generated sources and functional tests
    │   ├── android         Android related projects
    │   │   ├── app         Android example app
    │   │   └── test        Functional tests for generated Android library
    │   ├── base_api        C++ example app
    │   └── ios             iOS example app
    ├── libhello            Example library that provides Gluecodium-generated public API
    │   ├── lime            LimeIDL interface definitions for the public API
    │   └── src             Example library implementation
    └── scripts             Usefule scripts
       ├── build-cpp        Builds the entire project for C++ users
       ├── build-android    Builds the entire project for Android users
       └── build-swift      Builds the entire project for Swift users


## Building and testing

Invoke the following script to build the entire project for C++ users:

```bash
./scripts/build-cpp --buildGluecodium
```

Install artifacts end up in the dist/ folder and are ready for re-distribution.
To see all available options, run `./scripts/build-cpp --help`.

## Run iOS example app

Prerequisites:
```
brew install cmake
brew install ninja
```

Then build Gluecodium, generate code and build the examples application using a script:
```
cd gluecodium/examples/
./scripts/build-ios-on-mac-app
```

Open examples project `gluecodium/examples/platforms/ios/hello_swift.xcodeproj` in Xcode and start the simulator.

## Run Android example app

If not already done, setup your Android development environment. The following environment variables are mandatory
```
export ANDROID_HOME=~/Android/Sdk   # on mac: ~/Library/Android/sdk
export ANDROID_NDK_HOME=${ANDROID_HOME}/ndk-bundle
export SDK_ROOT=${ANDROID_HOME}
export NDK_ROOT=${ANDROID_NDK_HOME}
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
```
You might want to put these into your `.profile`.

Build Android example application:
```
cd gluecodium/examples/
./scripts/build-android --buildGluecodium
```

Once you run successfully the step above, it's possible to run the example Android app.

In order to do so, the easiest way is to open the example Android app project with Android Studio: go to File→Open and use this path: `gluecodium/examples/platforms/android`

Once the project is loaded, launch 'app' from the toolbar in the upper right corner.
