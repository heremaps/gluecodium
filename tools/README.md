# Gluecodium-related tools
This directory contains additional tools related to Gluecodium project.

## IntelliJ IDEA syntax highlighter for LimeIDL
_What does it do_: highlights syntax for LimeIDL files when you open them in IntelliJ IDEA
IDE (or any other IDE derived from it, e.g. Android Studio, etc.).

_How to install_: In the IntelliJ IDEA IDE go to **File** -> **Import Settings...** menu, choose
"tools/Lime_IDL_file_type_for_IntelliJ.jar" file in the file dialog, then click "OK" few times until
it's done.

## Sublime Text syntax highlighter for LimeIDL

_What does it do_: highlights syntax for LimeIDL files when you open them in Sublime Text editor.

_How to install_: https://packagecontrol.io/packages/Gluecodium

## Minimal launcher
_What does it do_: provides a minimal set of scripts to run Gluecodium from a binary distribution,
without a need of any compilation or download.

_How to install_: copy the "launcher" directory locally.

_How to run_: from command line, while in the local "launcher" directory, execute `gradle run`. To
pass command line parameters to Gluecodium, execute `gradle run --args="..."`. For example, to see
the version number of Gluecodium you're running, execute `gradle run --args="-version"`. To run a
non-latest version of Gluecodium, execute `gradle run -Pversion=N.N.N`, for example
`gradle run -Pversion=6.3.0 --args="-help"`.

## Gluecodium diff script

_What does it do_: provides a simple means for generating code from two LIME IDL files and comparing
the results with a diff tool.

_How to install_: copy the "launcher" directory locally and "gluediff.sh" file locally, both into the
 same local directory.

_How to run_: from command line, execute `<PATH_TO_GLUEDIFF>/gluediff.sh FILE1 FILE2 DIFF_TOOL`.
`FILE1` and `FILE2` should paths to the two input LIME IDL files. `DIFF_TOOL` should the command to
run a diff tool. Optionally, any additional parameters added are passed verbatim to Gluecodium
execution, e.g `./gluediff.sh FILE1 FILE2 DIFF_TOOL -generators swift` will generate only Swift files.
