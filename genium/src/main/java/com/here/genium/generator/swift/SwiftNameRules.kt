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

package com.here.genium.generator.swift

import com.here.genium.generator.common.NameHelper
import com.here.genium.model.franca.DefinedBy
import com.here.genium.model.franca.FrancaDeploymentModel
import com.here.genium.model.swift.SwiftType
import org.franca.core.franca.FArgument
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import java.io.File

object SwiftNameRules {

    val TARGET_DIRECTORY = "swift${File.separator}"

    fun getImplementationFileName(francaTypeCollection: FTypeCollection) =
        (TARGET_DIRECTORY +
            DefinedBy.getPackages(francaTypeCollection).joinToString(File.separator) +
            File.separator +
            getFileName(francaTypeCollection) +
            ".swift")

    private fun getFileName(francaTypeCollection: FTypeCollection) =
        when (francaTypeCollection) {
            is FInterface -> SwiftNameRules.getClassName(francaTypeCollection.getName())
            else -> getTypeCollectionName(francaTypeCollection)
        }

    fun getMethodName(method: FMethod) = NameHelper.toLowerCamelCase(method.name)

    fun getParameterName(argument: FArgument) = NameHelper.toLowerCamelCase(argument.name)

    fun getClassName(name: String) = NameHelper.toUpperCamelCase(name)

    fun getStructName(structName: FStructType, deploymentModel: FrancaDeploymentModel) =
        getTypeName(structName, deploymentModel)

    fun getTypeName(element: FModelElement, deploymentModel: FrancaDeploymentModel) =
        getNamespacePrefix(
            element,
            deploymentModel
        ) + NameHelper.toUpperCamelCase(element.name)

    private fun getNamespacePrefix(
        elem: FModelElement,
        deploymentModel: FrancaDeploymentModel
    ): String {
        val definingTypeCollection = DefinedBy.findDefiningTypeCollection(elem)
        if (definingTypeCollection is FInterface) {
            if (elem is FTypeDef ||
                elem is FMapType ||
                !deploymentModel.isInterface(definingTypeCollection)
            ) {
                return getClassName(definingTypeCollection.getName()) + "."
            }
        }
        return ""
    }

    fun getFieldName(fieldName: String) = NameHelper.toLowerCamelCase(fieldName)

    private fun getTypeCollectionName(base: FTypeCollection) =
        NameHelper.toUpperCamelCase(base.name)

    fun getEnumTypeName(francaEnumerator: FModelElement, deploymentModel: FrancaDeploymentModel) =
        getTypeName(francaEnumerator, deploymentModel)

    fun getEnumItemName(francaEnumerator: FEnumerator) =
        getEnumItemName(francaEnumerator.name)

    fun getEnumItemName(enumItemName: String) = NameHelper.toLowerCamelCase(enumItemName)

    fun getConstantName(name: String) = NameHelper.toLowerCamelCase(name)

    fun getPropertyName(name: String, swiftType: SwiftType) =
        when {
            swiftType === SwiftType.BOOL -> "is" + NameHelper.toUpperCamelCase(name)
            else -> NameHelper.toLowerCamelCase(name)
        }

    fun getTypeDefName(
        francaModelElement: FModelElement,
        deploymentModel: FrancaDeploymentModel
    ) = getTypeName(francaModelElement, deploymentModel)

    fun getMapName(
        francaModelElement: FModelElement,
        deploymentModel: FrancaDeploymentModel
    ) = getTypeName(francaModelElement, deploymentModel).replace('.', '_')
}
