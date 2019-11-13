/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

@file:Suppress("unused", "UnstableApiUsage")

package com.here.gluecodium.gradle

import com.android.build.gradle.AppExtension
import com.android.build.gradle.BaseExtension
import com.android.build.gradle.LibraryExtension
import com.android.build.gradle.api.BaseVariant
import com.android.build.gradle.internal.api.TestedVariant
import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.internal.tasks.DefaultSourceSet
import org.gradle.api.model.ObjectFactory
import org.gradle.api.plugins.JavaPlugin
import org.gradle.api.plugins.JavaPluginConvention
import java.io.File
import javax.inject.Inject

class GluecodiumPlugin @Inject constructor(private val objectFactory: ObjectFactory) : Plugin<Project> {

    override fun apply(project: Project) {
        val gluecodiumExtension =
            project.extensions.create(GLUECODIUM_EXTENSION_NAME, GluecodiumExtension::class.java)

        val javaGenerator: String
        if (project.pluginManager.hasPlugin("com.android.base")) {
            javaGenerator = "android"
            applyAndroid(project, gluecodiumExtension)
        } else {
            javaGenerator = "java"
            applyJava(project, gluecodiumExtension)
        }

        project.tasks.register(GLUECODIUM_TASK_NAME, GluecodiumTask::class.java) {
            it.description = "Processes Gluecodium IDL files"
            it.javaGenerator = javaGenerator
            propagateExtensionProperties(it, gluecodiumExtension)
        }
    }

    private fun applyAndroid(project: Project, gluecodiumExtension: GluecodiumExtension) {
        val androidExtension = project.extensions.getByName("android") as BaseExtension

        val sourceSets = androidExtension.sourceSets
        sourceSets.forEach { it.java.srcDir(gluecodiumExtension.outputDirectory) }
        setDefaultGluecodiumSources(project, gluecodiumExtension, sourceSets.map { it.name })

        project.afterEvaluate { injectGluecodiumTask(androidExtension) }
    }

    private fun applyJava(project: Project, gluecodiumExtension: GluecodiumExtension) {
        project.pluginManager.apply(JavaPlugin::class.java)

        val sourceSets = project.convention.getPlugin(JavaPluginConvention::class.java)
            .sourceSets
            .filterIsInstance<DefaultSourceSet>()
        sourceSets.forEach { it.java.srcDir(gluecodiumExtension.outputDirectory) }
        setDefaultGluecodiumSources(project, gluecodiumExtension, sourceSets.map { it.name })

        sourceSets.forEach { sourceSet ->
            project.tasks.named(sourceSet.compileJavaTaskName) { compileTask ->
                compileTask.dependsOn(GLUECODIUM_TASK_NAME)
            }
        }
    }

    private fun setDefaultGluecodiumSources(
        project: Project,
        gluecodiumExtension: GluecodiumExtension,
        sourceSetNames: List<String>
    ) {
        val defaultSources = sourceSetNames.map { "${project.rootDir}/src/$it/$GLUECODIUM_DIR_NAME" }
        gluecodiumExtension.source.convention(project.files(defaultSources).asFileTree)
        gluecodiumExtension.outputDirectory.convention(
            File("${project.buildDir}/generated-src/$GLUECODIUM_DIR_NAME")
        )
    }

    private fun propagateExtensionProperties(task: GluecodiumTask, gluecodiumExtension: GluecodiumExtension) {
        task.source(gluecodiumExtension.source)
        task.outputDirectory.set(gluecodiumExtension.outputDirectory)
        task.auxiliarySource.set(gluecodiumExtension.auxiliarySource)
        task.copyrightHeaderFile.set(gluecodiumExtension.copyrightHeaderFile)
        task.javaPackage.set(gluecodiumExtension.javaPackage)
        task.javaInternalPackage.set(gluecodiumExtension.javaInternalPackage)
        task.javaNameRules.set(gluecodiumExtension.javaNameRules)
        task.javaNonNullAnnotation.set(gluecodiumExtension.javaNonNullAnnotation)
        task.javaNullableAnnotation.set(gluecodiumExtension.javaNullableAnnotation)
        task.androidMergeManifest.set(gluecodiumExtension.androidMergeManifest)
        task.cppNamespace.set(gluecodiumExtension.cppNamespace)
        task.cppInternalNamespace.set(gluecodiumExtension.cppInternalNamespace)
        task.cppExportMacroName.set(gluecodiumExtension.cppExportMacroName)
        task.cppNameRules.set(gluecodiumExtension.cppNameRules)
    }

    private fun injectGluecodiumTask(androidExtension: BaseExtension) {
        val variants = when (androidExtension) {
            is AppExtension -> androidExtension.applicationVariants
            is LibraryExtension -> androidExtension.libraryVariants
            else -> emptyList<BaseVariant>()
        }
        val testVariants =
            variants.filterIsInstance<TestedVariant>().mapNotNull { it.testVariant }

        val allVariants = variants + testVariants
        for (variant in allVariants) {
            val taskProviders = variant.externalNativeBuildProviders + variant.javaCompileProvider
            for (taskProvider in taskProviders) {
                taskProvider.configure { it.dependsOn(GLUECODIUM_TASK_NAME) }
            }
        }
    }

    companion object {
        private const val GLUECODIUM_DIR_NAME = "gluecodium"
        private const val GLUECODIUM_EXTENSION_NAME = "gluecodium"
        private const val GLUECODIUM_TASK_NAME = "generateGluecodiumSources"
    }
}
