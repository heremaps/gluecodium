Gluecodium testing approach
===========================

This document describes the types of automated tests in Gluecodium project.

Unit tests
----------

Unit tests in Gluecodium are small-scale white-box tests, mostly covering the supporting infrastructure, not the main
logic in generators. Most logic in generators is either expressed in Mustache templates (which cannot be unit-tested) or
is based on LIME model tree traversal (which requires rather complex setup of mocks/fakes for fine-grained testing).
Instead, generator logic is tested with large-scale white-box tests (see `"Smoke" tests` below).

Currently, the following groups of unit tests exist:
* a few tests for utility classes in :lime-runtime Gradle project
* a few regression tests for specific use cases in :lime-loader Gradle project
* tests for template helpers in :gluecodium Gradle project
* tests for topological sorting algorithm in :gluecodium
* tests for various validators in :gluecodium

"Smoke" tests
-------------

"Smoke" tests in Gluecodium are large-scale white-box tests where the output code is generated based on given IDL files
and then this output is compared to existing reference files. It would be more correct to call these "acceptance" tests,
as "smoke" tests are usually just a few in number - which is not the case for Gluecodium "smoke" tests.

The "smoke" tests are implemented as a single parameterized unit test `SmokeTest.kt`. The test auto-loads its test data
from the "resources/smoke" sub-directory. It sorts out the files into "input" IDL files and per-generator "reference"
files based on directory structure: "<test-name>/input" for IDL files (and sometimes additional files like options or
name rules), "<test-name>/output/<generator-name>" for reference files. If the "output" directory of some test case does
not have a sub-directory for a particular generator, the test case is ignored for this generator, but there is no
failure.

Functional tests
----------------

Functional tests in Gluecodium ("functional-tests" directory) are large-scale black-box tests where the output code is
generated based on given IDL files, compiled with the tools appropriate for each corresponding language, and then run
through a set of unit tests which use the compiled code as a library. While the testing happens through unit tests, with
regard to Gluecodium itself these tests are black-box tests, since they are using Gluecodium as a tool, like a user
would.

These tests could be run locally (see [Development tools](development_tools.md) for the list of required software). They
are also run on CI (currently GitHub Actions CI, see the [config](../../.github/workflows/functional-tests.yml) for
details).
