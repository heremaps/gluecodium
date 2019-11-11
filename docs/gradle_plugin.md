Gluecodium Gradle plugin
====================

Gluecodium Gradle plugin can be used to invoke Gluecodium code generation for Java from a Gradle build
script.

Integration
-----------

Gluecodium plugin registers a custom Gradle task for Gluecodium code generation. If Android Gradle plugin is
detected, Gluecodium plugin adds the generation task as a dependency for all `JavaCompile` and
`ExternalNativeBuild` tasks. If no Android plugin is detected, Gluecodium plugin applies the default
Java Gradle plugin and adds the generation task as a dependency for `JavaCompile` tasks.

Usage
-----

To use the Gluecodium Gradle plugin, include the following in your build script:

```groovy
buildscript {
    dependencies {
        classpath "com.here.gluecodium:gluecodium-gradle:5.8.0"
    }
}

apply plugin: 'gluecodium.gradle'
```

To configure Gluecodium code generation, add an entry to the `gluecodium {}` script block:

```groovy
gluecodium {
    source = fileTree("${rootDir}/sample/gluecodium/lime")
    outputDirectory = file("$buildDir/generated-src/gluecodium")

    copyrightHeaderFile = file("${rootDir}/sample/gluecodium/copyright.in")
    javaPackage = 'com.example.sample'
    javaInternalPackage = 'com.example.sample.internal'
    javaNameRules = file("${rootDir}/sample/gluecodium/namerules/java.properties")
    javaNonNullAnnotation = 'android.support.annotation.NonNull'
    javaNullableAnnotation = 'android.support.annotation.Nullable'
    androidMergeManifest = file("${rootDir}/sample/gluecodium/AndroidManifest.xml")
    cppNamespace = 'sample'
    cppInternalNamespace = 'sample.internal'
    cppExportMacroName = 'GLUECODIUM_SAMPLE_EXPORT'
    cppNameRules = file("${rootDir}/sample/gluecodium/namerules/cpp.properties")
}
```

All of these properties come with valid defaults, so you don't have specify the values explicitly if
the defaults work for your build.
