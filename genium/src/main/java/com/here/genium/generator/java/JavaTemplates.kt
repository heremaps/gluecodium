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

package com.here.genium.generator.java

import com.here.genium.generator.common.GeneratedFile
import com.here.genium.generator.common.templates.TemplateEngine
import com.here.genium.model.java.JavaClass
import com.here.genium.model.java.JavaElement
import com.here.genium.model.java.JavaEnum
import com.here.genium.model.java.JavaExceptionClass
import com.here.genium.model.java.JavaInterface
import com.here.genium.model.java.JavaTopLevelElement

class JavaTemplates(generatorName: String) {

    private val javaFileMapper: JavaFileMapper = JavaFileMapper(generatorName)

    fun generateFiles(javaModel: List<JavaElement>): List<GeneratedFile> {
        val classFiles = javaModel.filterIsInstance<JavaClass>()
            .map { generateFileForElement("java/ClassHeader", it) }
        val interfaceFiles = javaModel.filterIsInstance<JavaInterface>()
            .map { generateFileForElement("java/Interface", it) }
        val enumFiles = javaModel.filterIsInstance<JavaEnum>()
            .map { generateFileForElement("java/EnumHeader", it) }
        val exceptionFiles = javaModel.filterIsInstance<JavaExceptionClass>()
            .map { generateFileForElement("java/ExceptionFile", it) }

        return classFiles + interfaceFiles + enumFiles + exceptionFiles
    }

    private fun generateFileForElement(templateName: String, javaElement: JavaTopLevelElement) =
        GeneratedFile(
            TemplateEngine.render(templateName, javaElement),
            javaFileMapper.getFileName(javaElement)
        )

    companion object {
        fun generateNativeBase(fileName: String, packageList: List<String>) =
            GeneratedFile(TemplateEngine.render("java/NativeBase", packageList), fileName)
    }
}
