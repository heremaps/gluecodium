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

package com.here.genium.generator.cbridge

import com.here.genium.generator.common.NameHelper
import com.here.genium.model.franca.DefinedBy
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeCollection
import java.nio.file.Paths

object CBridgeNameRules {
    const val CBRIDGE_PUBLIC = "cbridge"
    const val CBRIDGE_INTERNAL = "cbridge_internal"
    const val INCLUDE_DIR = "include"

    val STRING_HANDLE_FILE = Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "StringHandle.h").toString()
    val BASE_HANDLE_IMPL_FILE =
        Paths.get(CBRIDGE_INTERNAL, INCLUDE_DIR, "BaseHandleImpl.h").toString()
    val BASE_HANDLE_FILE = Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "BaseHandle.h").toString()
    val EXPORT_FILE = Paths.get(CBRIDGE_PUBLIC, INCLUDE_DIR, "Export.h").toString()
    const val SRC_DIR = "src"

    const val BASE_REF_NAME = "_baseRef"

    const val UNDERSCORE_DELIMITER = "_"
    const val PUBLIC_HEADER_SUFFIX = ".h"
    const val IMPL_SUFFIX = ".cpp"
    const val CBRIDGE_PREFIX = "cbridge_"

    fun getName(francaTypeCollection: FTypeCollection) =
        NameHelper.toUpperCamelCase(francaTypeCollection.name)

    fun getFunctionTableName(francaInterface: FInterface) =
        getInterfaceName(francaInterface) + "_FunctionTable"

    fun getInterfaceName(francaInterface: FInterface) =
        getNestedNameSpecifier(francaInterface).joinToString(UNDERSCORE_DELIMITER)

    fun getShortMethodName(method: FMethod) =
        if (method.selector != null && !method.selector.isEmpty()) {
            (NameHelper.toLowerCamelCase(method.name) +
                    UNDERSCORE_DELIMITER +
                    method.selector)
        } else {
            NameHelper.toLowerCamelCase(method.name)
        }

    fun getStructBaseName(francaElement: FModelElement) =
        joinQualifiedName(
            getNestedNameSpecifier(francaElement),
            NameHelper.toUpperCamelCase(francaElement.name)
        )

    fun getInstanceBaseName(francaElement: FModelElement) =
        getNestedNameSpecifier(francaElement).joinToString(UNDERSCORE_DELIMITER)

    private fun joinQualifiedName(nameSpecifier: List<String>, name: String) =
        (nameSpecifier + name).joinToString(UNDERSCORE_DELIMITER)

    private fun getNestedNameSpecifier(modelElement: FModelElement): List<String> {
        val typeCollection = DefinedBy.findDefiningTypeCollection(modelElement)
        return DefinedBy.getPackages(typeCollection) +
            NameHelper.toUpperCamelCase(typeCollection.name)
    }

    fun getNestedSpecifierString(modelElement: FModelElement) =
        getNestedNameSpecifier(modelElement).joinToString(UNDERSCORE_DELIMITER)

    fun getEnumItemName(francaEnumItem: FEnumerator) =
        joinQualifiedName(
            getNestedNameSpecifier(francaEnumItem), francaEnumItem.name.toLowerCase()
        )

    fun getEnumName(francaEnumerator: FModelElement) =
        joinQualifiedName(
            getNestedNameSpecifier(francaEnumerator),
            NameHelper.toUpperCamelCase(francaEnumerator.name)
        )

    fun getBaseApiCall(
        category: CppTypeInfo.TypeCategory,
        baseAPIName: String
    ): String =
        when {
            category === CppTypeInfo.TypeCategory.CLASS -> "std::shared_ptr<$baseAPIName>"
            else -> baseAPIName
        }

    fun getPropertySetterName(attribute: FAttribute) =
        NameHelper.toLowerCamelCase(attribute.name) + "_set"

    fun getPropertyGetterName(attribute: FAttribute) =
        NameHelper.toLowerCamelCase(attribute.name) + "_get"

    fun getMapName(francaElement: FModelElement) =
        joinQualifiedName(
            getNestedNameSpecifier(francaElement),
            NameHelper.toUpperCamelCase(francaElement.name)
        )
}
