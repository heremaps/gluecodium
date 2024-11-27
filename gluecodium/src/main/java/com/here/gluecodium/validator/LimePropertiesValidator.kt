/*
 * Copyright (C) 2016-2024 HERE Europe B.V.
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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeAttributeType.CACHED
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.REF
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.validator.LimeValidatorUtils.needsDocumentationComment

internal class LimePropertiesValidator(private val logger: LimeLogger, generatorOptions: GeneratorOptions = GeneratorOptions()) {
    private val werrorPropertiesDocs = generatorOptions.werror.contains(GeneratorOptions.WARNING_LIME_PROPERTIES_DOCS)
    private val maybeError: LimeLogger.(LimeNamedElement, String) -> Unit =
        if (werrorPropertiesDocs) LimeLogger::error else LimeLogger::warning

    fun validate(limeModel: LimeModel): Boolean {
        val validationResults =
            limeModel.referenceMap.values
                .filterIsInstance<LimeContainerWithInheritance>()
                .map { validateProperties(it, limeModel.referenceMap) }

        return !validationResults.contains(false)
    }

    private fun validateProperties(
        limeContainer: LimeContainerWithInheritance,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        val allPropertyNames = (limeContainer.properties + limeContainer.inheritedProperties).map { it.name }
        return !limeContainer.properties
            .map { validateProperty(it, allPropertyNames, limeContainer, referenceMap) }
            .contains(false)
    }

    private fun validateProperty(
        limeProperty: LimeProperty,
        allPropertyNames: List<String>,
        parentElement: LimeContainerWithInheritance,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        var result = true
        if (allPropertyNames.filter { it == limeProperty.name }.size > 1) {
            logger.error(limeProperty, "property has conflicting overloads")
            result = false
        }
        if (limeProperty.attributes.have(CACHED) && limeProperty.setter != null) {
            logger.error(limeProperty, "read-write property cannot be @Cached")
            result = false
        }
        if (limeProperty.attributes.have(CPP, REF) && parentElement is LimeInterface) {
            logger.error(limeProperty, "property in an interface cannot be marked with @Cpp(Ref)")
            result = false
        }
        if (needsDocumentationComment(limeProperty, referenceMap) && !validateComments(limeProperty)) {
            if (werrorPropertiesDocs) {
                result = false
            }
        }
        return result
    }

    private fun validateComments(limeProperty: LimeProperty): Boolean {
        val propertiesDocsErrorMessage = "property must be documented; check 'docs/lime_markdown.md'"
        var result = true

        if (limeProperty.comment.isEmpty()) {
            logger.maybeError(limeProperty, "main comment is empty; $propertiesDocsErrorMessage")
            result = false
        }

        if (limeProperty.getter.returnType.comment.isEmpty()) {
            logger.maybeError(limeProperty, "return of getter is not documented; $propertiesDocsErrorMessage")
            result = false
        }

        if (limeProperty.setter != null) {
            val isSetterCommentEmpty = limeProperty.setter?.parameters?.firstOrNull()?.comment?.isEmpty()
            if (isSetterCommentEmpty == null || isSetterCommentEmpty) {
                logger.maybeError(limeProperty, "parameter of setter is not documented; $propertiesDocsErrorMessage")
                result = false
            }
        }

        return result
    }
}
