/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.generator.kotlin

import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct

internal class KotlinGeneratorPredicates(private val internalVisibilityPredicate: KotlinInternalVisibilityPredicate) {
    val predicates =
        mapOf(
            "hasAnyComment" to this::hasAnyComment,
            "hasStaticFunctions" to this::hasStaticFunctions,
            "needsDisposer" to this::needsDisposer,
            "needsCompanionObject" to this::needsCompanionObject,
            "hasConstants" to this::hasConstants,
            "hasFactoryOnlyCompanion" to this::hasFactoryOnlyCompanion,
            "hasHiddenConstructors" to this::hasHiddenConstructors,
            "hasInternalAllArgsConstructor" to this::hasInternalAllArgsConstructor,
            "hasInternalFreeArgsConstructor" to this::hasInternalFreeArgsConstructor,
            "hasStaticProperties" to this::hasStaticProperties,
            "hidesAllArgsConstructor" to this::hidesAllArgsConstructor,
            "hidesConstructor" to this::hidesConstructor,
            "hidesFreeArgsConstructor" to this::hidesFreeArgsConstructor,
            "hidesPositionalDefaultsConstructor" to this::hidesPositionalDefaultsConstructor,
            "isExceptionSameForCtorAndHookFun" to this::isExceptionSameForCtorAndHookFun,
            "isFunctionalInterface" to this::isFunctionalInterface,
            "isInternal" to this::isInternal,
            "propertyGetterRequiresJvmName" to this::propertyGetterRequiresJvmName,
            "propertySetterRequiresJvmName" to this::propertySetterRequiresJvmName,
            "needsAllFieldsConstructor" to this::needsAllFieldsConstructor,
        )

    private fun hasAnyComment(element: Any) = CommonGeneratorPredicates.hasAnyComment(element, "Kotlin")

    private fun needsAllFieldsConstructor(limeStruct: Any): Boolean {
        return when {
            limeStruct !is LimeStruct -> false
            limeStruct.external?.kotlin?.get(LimeExternalDescriptor.CONVERTER_NAME) != null -> true
            limeStruct.attributes.have(LimeAttributeType.KOTLIN, LimeAttributeValueType.POSITIONAL_DEFAULTS) -> false
            limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> limeStruct.allFieldsConstructor == null
            limeStruct.fieldConstructors.isEmpty() -> limeStruct.initializedFields.isEmpty()
            else -> false
        }
    }

    private fun hasStaticFunctions(element: Any) =
        when (element) {
            is LimeContainer -> element.functions.any { it.isStatic }
            else -> false
        }

    private fun hasConstants(element: Any) =
        when (element) {
            is LimeContainer -> element.constants.isNotEmpty()
            else -> false
        }

    private fun needsDisposer(element: Any) =
        when (element) {
            is LimeClass -> element.parentClass == null
            is LimeLambda -> true
            else -> false
        }

    private fun hasStaticProperties(element: Any) =
        when (element) {
            is LimeContainerWithInheritance -> element.properties.any { it.isStatic }
            else -> false
        }

    private fun needsParcelCreator(element: Any): Boolean {
        if (element !is LimeStruct) {
            return false
        }

        return element.attributes.have(LimeAttributeType.SERIALIZABLE)
    }

    private fun hasInternalAllArgsConstructor(limeStruct: Any): Boolean =
        limeStruct is LimeStruct &&
            limeStruct.fields.any {
                CommonGeneratorPredicates.isInternal(
                    it,
                    LimeAttributeType.KOTLIN,
                ) || CommonGeneratorPredicates.isInternal(it.typeRef.type, LimeAttributeType.KOTLIN)
            }

    private fun hasInternalFreeArgsConstructor(limeStruct: Any): Boolean =
        limeStruct is LimeStruct &&
            limeStruct.uninitializedFields.any {
                CommonGeneratorPredicates.isInternal(it, LimeAttributeType.KOTLIN) ||
                    CommonGeneratorPredicates.isInternal(it.typeRef.type, LimeAttributeType.KOTLIN)
            }

    // Kotlin does not allow @JvmSynthetic on constructors and compiles an internal constructor as public JVM API.
    // Conceptually internal constructors are therefore private. Kotlin code calls them through synthetic companion
    // 'invoke' factories, which keep the constructor call syntax for Kotlin and hide the factories from Java.
    private fun hidesConstructor(element: Any) =
        when (element) {
            is LimeFunction -> element.isConstructor && internalVisibilityPredicate.isConceptuallyInternal(element)
            is LimeFieldConstructor -> internalVisibilityPredicate.isConceptuallyInternal(element)
            else -> false
        }

    private fun hidesFreeArgsConstructor(limeStruct: Any) =
        limeStruct is LimeStruct && (hasInternalFreeArgsConstructor(limeStruct) || isConceptuallyInternal(limeStruct))

    private fun hidesAllArgsConstructor(limeStruct: Any) =
        limeStruct is LimeStruct && (hasInternalAllArgsConstructor(limeStruct) || isConceptuallyInternal(limeStruct))

    private fun hidesPositionalDefaultsConstructor(limeStruct: Any) = limeStruct is LimeStruct && isConceptuallyInternal(limeStruct)

    private fun isConceptuallyInternal(element: LimeNamedElement) = internalVisibilityPredicate.isConceptuallyInternal(element)

    private fun hasHiddenConstructors(element: Any): Boolean =
        when (element) {
            is LimeClass -> element.constructors.any { hidesConstructor(it) }
            is LimeStruct -> hasHiddenStructConstructors(element)
            is LimeException -> isConceptuallyInternal(element)
            else -> false
        }

    // Mirrors the constructor selection in KotlinStruct.mustache, so a companion object is generated for factories
    // only when at least one generated constructor is hidden.
    private fun hasHiddenStructConstructors(limeStruct: LimeStruct): Boolean {
        if (limeStruct.constructors.any { hidesConstructor(it) }) return true
        if (limeStruct.fields.isEmpty()) return false

        val hasPositionalDefaults = limeStruct.attributes.have(LimeAttributeType.KOTLIN, LimeAttributeValueType.POSITIONAL_DEFAULTS)
        val hasNoFieldConstructors = limeStruct.fieldConstructors.isEmpty()
        if (limeStruct.constructors.isEmpty()) {
            val hasFreeArgsConstructor = hasNoFieldConstructors && limeStruct.initializedFields.isNotEmpty() && !hasPositionalDefaults
            if (hasFreeArgsConstructor && hidesFreeArgsConstructor(limeStruct)) return true
            if (needsAllFieldsConstructor(limeStruct) && hidesAllArgsConstructor(limeStruct)) return true
        }

        return limeStruct.fieldConstructors.any { hidesConstructor(it) } ||
            (hasNoFieldConstructors && hasPositionalDefaults && hidesPositionalDefaultsConstructor(limeStruct))
    }

    private fun isExceptionSameForCtorAndHookFun(constructor: Any): Boolean {
        return when (constructor) {
            is LimeFunction -> CommonGeneratorPredicates.isExceptionSameForCtorAndHookFun(constructor)
            else -> false
        }
    }

    private fun isFunctionalInterface(limeInterface: Any): Boolean {
        if (limeInterface !is LimeInterface) {
            return false
        }

        val nonStaticFunctionsCount =
            limeInterface.functions.filter { !it.isStatic }.size +
                limeInterface.inheritedFunctions.filter { !it.isStatic }.size

        val nonStaticPropertiesCount =
            limeInterface.properties.filter { !it.isStatic }.size +
                limeInterface.inheritedProperties.filter { !it.isStatic }.size

        // In Kotlin, a functional interface:
        // - can have only one non-static function
        // - cannot have non-static properties
        // - can have multiple static functions/properties
        return nonStaticFunctionsCount == 1 && nonStaticPropertiesCount == 0
    }

    private fun needsCompanionObject(element: Any) = hasCompanionContent(element) || hasHiddenConstructors(element)

    // A companion object, which only holds the synthetic factories of hidden constructors, is internal.
    // Otherwise it would add an empty object to the public Kotlin API of a public type.
    private fun hasFactoryOnlyCompanion(element: Any) = !hasCompanionContent(element) && hasHiddenConstructors(element)

    private fun hasCompanionContent(element: Any) =
        hasStaticFunctions(element) || hasConstants(element) || needsDisposer(element) ||
            hasStaticProperties(element) || needsParcelCreator(element)

    private fun propertyGetterRequiresJvmName(property: Any) =
        property is LimeProperty && (
            CommonGeneratorPredicates.isInternal(property, LimeAttributeType.KOTLIN) ||
                property.getter.attributes.have(LimeAttributeType.KOTLIN, LimeAttributeValueType.NAME)
        )

    private fun propertySetterRequiresJvmName(property: Any) =
        property is LimeProperty && (
            CommonGeneratorPredicates.isInternal(property, LimeAttributeType.KOTLIN) ||
                (property.setter?.attributes?.have(LimeAttributeType.KOTLIN, LimeAttributeValueType.NAME)) ?: false
        )

    private fun isInternal(element: Any) =
        element is LimeNamedElement && CommonGeneratorPredicates.isInternal(element, LimeAttributeType.KOTLIN)
}
