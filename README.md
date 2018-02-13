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

To run the transpiler and generate some output based on the current set of
HelloWorld project's \*.fidl files:

```bash
./transpile -input ../../projects/hello_world/libhello/fidl -output ../generated -nostdout
```

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

And add the *TranspilerReviewers* group manually on Gerrit's web interface.

## Command line parameters
For information on Transpiler command line parameters run it with "-help":

```bash
./transpile -help
```

## Caching of output files
Activation of caching feature in transpiler is done by passing the command line option, like:

```bash
./transpile -enableCaching -input <input folder> -output <output folder>
```

Running transpiler with this option will generate a directory called *.cache* inside *output folder*
(regardless of -enableCaching option, caching gets automatically deactivated in case no valid output
directory is given). Inside this folder transpiler creates the cache index files (*cpp*,*android* &
*swift*) which contain hash values of all output files written in current run by the corresponding
generator. By utilizing the hash values, transpiler is able to prevent files from being overwritten
with exact same content on subsequent runs.

Additionally, files written in former transpiler runs which are not generated in current run will be
removed from built folder together with their cache entries.

They are two situations where all cache contents get automatically deleted:

* If an error occurs while generating files (because then, consistency between hash values and file
system cannot be guaranteed).
* If transpiler gets started with disabled caching, but on a folder containing cache index files
(transpiler might alter file contents of existing files or remove files etc. which could lead to
inconsistent cache).

## License
    Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.

    This software and other materials contain proprietary information of HERE
    and are protected by applicable copyright legislation. Any use and
    utilization of this software and other materials and disclosure to any
    third parties is conditional upon having a separate agreement with HERE
    for the use, utilization or disclosure of this software. In the absence of
    such agreement, the use of the software is not allowed.
