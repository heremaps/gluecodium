Gluecodium release process
==========================

This document describes the approach to versioning and release process of the Gluecodium process.

Semantic versioning
-------------------

Gluecodium loosely follows the approach to version numbers known as "semantic versioning". Quoting
[semver.org](https://semver.org):

> Given a version number MAJOR.MINOR.PATCH, increment the:
> 1. MAJOR version when you make incompatible API changes,
> 2. MINOR version when you add functionality in a backwards compatible manner, and
> 3. PATCH version when you make backwards compatible bug fixes.

Gluecodium versions mostly follow this logic. The exceptions are based on the size of the feature being added:
* for *very small* features only PATCH version is incremented, even if it's not a bug fix.
* for *very big* features (e.g. a new generator) the MAJOR version is incremented, even if it's not breaking.

Changelog
---------

Committed user-visible changes to Gluecodium are (manually) tracked in the [CHANGELOG.md](../../CHANGELOG.md) file. Each
new change should be briefly described at the top of the file, under `Unreleased` section. Most changes fall either into
`Bug fixes` subsection or into `Features` subsection. There are also rarer subsections for breaking changes, for
deprecations, and for removals.

Committed changes that are not user-visible (e.g. refactoring) are not tracked in the changelog.

Release process
---------------

Gluecodium has no fixed release schedule. Most MINOR and PATCH releases happen on-demand, according to requirements from
internal (in-company) users of Gluecodium. For bigger features (all MAJOR releases, and some MINOR) the release happens
as soon as the feature is ready.

Each release raises the current Gluecodium version in a dedicated commit. The same commit should have the current
`Unreleased` section of the changelog converted into the `Release MAJOR.MINOR.PATCH` (also have a "release date" line
added there).

After the version change is committed, a release tag is created automatically by a dedicated trigger of the GitHub
Actions CI.
