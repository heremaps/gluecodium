# API Transpiler
This repository contains the HERE API Transpiler.

## Setup
Ensure that you got this repository by using the api-transpiler repo manifest:

```bash
repo init \
    -u ssh://user@example.com:29418/prime/manifest \
    -m api-transpiler.xml
```

You can build the project on the command-line or through IntelliJ /
Android Studio.

## Building and testing
Outside of IntelliJ you can invoke the following Gradle tasks to build
the entire project:

```bash
./gradlew build
```

To run the transpiler and generate some output based on the currentl set of
\*.fidl files:

```bash
./gradlew run \
    -Dexec.args="-input ../fidl -output ../generated -nostdout" \
    --stacktrace
```


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


## Continuous integration
The Jenkins jobs are currently part of Legacy CI and found
[here](example.com).


## License
    Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.

    This software and other materials contain proprietary information of HERE
    and are protected by applicable copyright legislation. Any use and
    utilization of this software and other materials and disclosure to any
    third parties is conditional upon having a separate agreement with HERE
    for the use, utilization or disclosure of this software. In the absence of
    such agreement, the use of the software is not allowed.
