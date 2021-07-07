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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.generator.common.GeneratedFile
import com.here.gluecodium.generator.common.Include
import com.here.gluecodium.generator.common.OptimizedListsCollector
import com.here.gluecodium.generator.common.templates.TemplateEngine
import com.here.gluecodium.generator.cpp.CppFullNameResolver
import com.here.gluecodium.generator.cpp.CppIncludeResolver
import com.here.gluecodium.generator.cpp.CppNameCache
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.generator.jni.JniGeneratorPredicates.Companion.hasThrowingFunctions
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributes
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType

internal class JniTemplates(
    private val limeReferenceMap: Map<String, LimeElement>,
    javaNameRules: JavaNameRules,
    private val basePackages: List<String>,
    private val internalPackages: List<String>,
    private val internalNamespace: List<String>,
    cppNameRules: CppNameRules,
    generatorName: String,
    nameCache: CppNameCache,
    activeTags: Set<String>
) {
    private val jniNameResolver = JniNameResolver(limeReferenceMap, basePackages, javaNameRules)
    private val cppNameResolver = CppNameResolver(limeReferenceMap, internalNamespace, nameCache)
    private val fileNameRules = JniFileNameRules(generatorName, jniNameResolver)
    private val nameResolvers = mapOf(
        "" to jniNameResolver,
        "signature" to JniTypeSignatureNameResolver(jniNameResolver),
        "mangled" to JniMangledNameResolver(jniNameResolver),
        "C++" to cppNameResolver,
        "C++ FQN" to CppFullNameResolver(nameCache)
    )
    private val predicates = JniGeneratorPredicates(limeReferenceMap, javaNameRules, cppNameResolver, activeTags).predicates

    private val cppIncludeResolver = CppIncludeResolver(limeReferenceMap, cppNameRules, internalNamespace)
    private val jniIncludeResolver = JniIncludeResolver(fileNameRules)
    private val jniIncludeCollector = JniIncludeCollector(jniIncludeResolver)

    fun generateFiles(limeElement: LimeNamedElement): List<GeneratedFile> {
        val optimizedLists = when (limeElement) {
            is LimeContainer -> OptimizedListsCollector().getAllOptimizedLists(limeElement)
            else -> emptyMap()
        }
        return when {
            limeElement is LimeStruct && (limeElement.functions.isNotEmpty() || optimizedLists.isNotEmpty()) ->
                generateFilesForElement(limeElement, optimizedLists)
            limeElement is LimeContainerWithInheritance || limeElement is LimeLambda ->
                generateFilesForElement(limeElement, optimizedLists)
            else -> emptyList()
        }
    }

    private fun generateFilesForElement(
        limeElement: LimeNamedElement,
        optimizedLists: Map<String, List<LimeList>>
    ): List<GeneratedFile> {
        val containerData = mutableMapOf("container" to limeElement, "internalNamespace" to internalNamespace)

        val fileName = fileNameRules.getElementFileName(limeElement)
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/Header", containerData, nameResolvers, predicates),
            fileNameRules.getHeaderFilePath(fileName)
        )

        val implIncludes =
            jniIncludeCollector.collectImports(limeElement) + Include.createInternalInclude("$fileName.h")
        containerData["includes"] = implIncludes.distinct().sorted() +
            listOfNotNull(JniIncludeResolver.exceptionThrowerInclude.takeIf { hasThrowingFunctions(limeElement) })

        val implFile = GeneratedFile(
            TemplateEngine.render("jni/Implementation", containerData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile) +
            optimizedLists.keys.flatMap { generateOptimizedListFiles(limeReferenceMap[it], optimizedLists[it]) }
    }

    private fun generateOptimizedListFiles(limeElement: LimeElement?, lists: List<LimeList>?): List<GeneratedFile> {
        if (limeElement !is LimeNamedElement || lists.isNullOrEmpty()) return emptyList()

        val containerFileName = fileNameRules.getElementFileName(limeElement)
        val containerData = mutableMapOf("container" to limeElement, "internalNamespace" to internalNamespace)

        return lists.flatMap { generateOptimizedListFile(it, containerFileName, containerData) }
    }

    private fun generateOptimizedListFile(
        limeList: LimeList,
        containerFileName: String,
        containerData: MutableMap<String, Any>
    ): List<GeneratedFile> {
        val elementFileNamePrefix = limeList.elementType.type.actualType.name
        val fileName = "${containerFileName}_${elementFileNamePrefix}LazyNativeList"

        containerData["listType"] = LimeDirectTypeRef(limeList, attributes = optimizedAttributes)
        containerData["elementType"] = limeList.elementType
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/LazyNativeListHeader", containerData, nameResolvers, predicates),
            fileNameRules.getHeaderFilePath(fileName)
        )

        val implIncludes = jniIncludeResolver.resolveElementImports(limeList.elementType) +
            Include.createInternalInclude("$fileName.h")
        containerData["includes"] = implIncludes.distinct().sorted()

        val implFile = GeneratedFile(
            TemplateEngine.render("jni/LazyNativeListImpl", containerData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    fun generateConversionFiles(allTypes: List<LimeType>): List<GeneratedFile> {
        val lambdas = allTypes.filterIsInstance<LimeLambda>()
        return allTypes.filterIsInstance<LimeStruct>().flatMap { generateStructConversionFiles(it) } +
            allTypes.filterIsInstance<LimeEnumeration>().flatMap { generateEnumConversionFiles(it) } +
            (lambdas + allTypes.filterIsInstance<LimeContainerWithInheritance>()).flatMap {
                generateInstanceConversionFiles(it)
            } + (lambdas + allTypes.filterIsInstance<LimeInterface>()).flatMap { generateCppProxyFiles(it) }
    }

    fun generateConversionUtilsHeaderFile(fileName: String) =
        GeneratedFile(
            TemplateEngine.render(
                "jni/utils/${fileName}Header",
                mapOf("internalNamespace" to internalNamespace)
            ),
            fileNameRules.getHeaderFilePath(fileName),
            GeneratedFile.SourceSet.COMMON
        )

    fun generateConversionUtilsImplementationFile(fileName: String) =
        GeneratedFile(
            TemplateEngine.render(
                "jni/utils/${fileName}Implementation",
                mapOf(
                    "internalNamespace" to internalNamespace,
                    "internalPackages" to basePackages + internalPackages
                )
            ),
            fileNameRules.getImplementationFilePath(fileName),
            GeneratedFile.SourceSet.COMMON
        )

    private fun generateStructConversionFiles(limeStruct: LimeStruct): List<GeneratedFile> {
        val fileName = fileNameRules.getConversionFileName(limeStruct)
        val selfInclude = Include.createInternalInclude("$fileName.h")
        val fieldConversionIncludes = limeStruct.fields.flatMap { jniIncludeResolver.resolveElementImports(it) }
        // Conversion includes need to be be added to the header file instead of the impl file, for unity builds.
        val headerIncludes = cppIncludeResolver.resolveElementImports(limeStruct).distinct().sorted() +
            fieldConversionIncludes.distinct().minus(selfInclude).sorted()

        val mustacheData = mutableMapOf(
            "struct" to limeStruct,
            "includes" to headerIncludes,
            "internalNamespace" to internalNamespace
        )
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/StructConversionHeader", mustacheData, nameResolvers),
            fileNameRules.getHeaderFilePath(fileName)
        )

        mustacheData["includes"] = listOf(selfInclude)
        val implFile = GeneratedFile(
            TemplateEngine.render("jni/StructConversionImplementation", mustacheData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    private fun generateEnumConversionFiles(limeEnumeration: LimeEnumeration): List<GeneratedFile> {
        val mustacheData = mutableMapOf(
            "enum" to limeEnumeration,
            "includes" to cppIncludeResolver.resolveElementImports(limeEnumeration).distinct().sorted(),
            "internalNamespace" to internalNamespace
        )

        val fileName = fileNameRules.getConversionFileName(limeEnumeration)
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/EnumConversionHeader", mustacheData, nameResolvers),
            fileNameRules.getHeaderFilePath(fileName)
        )

        mustacheData["includes"] = listOf(Include.createInternalInclude("$fileName.h"))
        val implFile = GeneratedFile(
            TemplateEngine.render("jni/EnumConversionImplementation", mustacheData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    private fun generateInstanceConversionFiles(limeElement: LimeNamedElement): List<GeneratedFile> {
        val fileName = fileNameRules.getConversionFileName(limeElement)
        val selfInclude = Include.createInternalInclude("$fileName.h")
        // Conversion includes need to be be added to the header file instead of the impl file, for unity builds.
        val headerIncludes = cppIncludeResolver.resolveElementImports(limeElement).distinct().sorted() +
            jniIncludeCollector.collectImports(limeElement).distinct().minus(selfInclude).sorted()

        val mustacheData = mutableMapOf(
            "model" to limeElement,
            "includes" to headerIncludes,
            "basePackages" to basePackages,
            "internalPackages" to basePackages + internalPackages,
            "internalNamespace" to internalNamespace
        )
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/InstanceConversionHeader", mustacheData, nameResolvers),
            fileNameRules.getHeaderFilePath(fileName)
        )

        mustacheData["includes"] = listOf(selfInclude) +
            if (limeElement is LimeInterface || limeElement is LimeLambda) {
                val proxyFileName = fileNameRules.getElementFileName(limeElement) + "CppProxy"
                listOf(Include.createInternalInclude("$proxyFileName.h"))
            } else emptyList()
        val implFile = GeneratedFile(
            TemplateEngine.render("jni/InstanceConversionImplementation", mustacheData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    private fun generateCppProxyFiles(limeElement: LimeNamedElement): List<GeneratedFile> {
        val mustacheData = mutableMapOf(
            "container" to limeElement,
            "includes" to cppIncludeResolver.resolveElementImports(limeElement).distinct().sorted(),
            "internalNamespace" to internalNamespace
        )

        val fileName = fileNameRules.getElementFileName(limeElement) + "CppProxy"
        val headerFile = GeneratedFile(
            TemplateEngine.render("jni/CppProxyHeader", mustacheData, nameResolvers, predicates),
            fileNameRules.getHeaderFilePath(fileName)
        )

        val selfInclude = Include.createInternalInclude("$fileName.h")
        val includes = jniIncludeCollector.collectImports(limeElement).distinct().minus(selfInclude).sorted()
        mustacheData["includes"] = listOf(selfInclude) + includes
        val implFile = GeneratedFile(
            TemplateEngine.render("jni/CppProxyImplementation", mustacheData, nameResolvers, predicates),
            fileNameRules.getImplementationFilePath(fileName)
        )

        return listOf(headerFile, implFile)
    }

    companion object {
        private val optimizedAttributes = LimeAttributes.Builder().addAttribute(LimeAttributeType.OPTIMIZED).build()
    }
}
