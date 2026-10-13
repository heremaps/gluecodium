/*
 * Copyright (C) 2016-2026 HERE Europe B.V.
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

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.model.lime.LimeAttributeType.CACHED
import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeValueType.INTERFACE
import com.here.gluecodium.model.lime.LimeAttributeValueType.REF
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeNamedElement

internal class KotlinInterfacesValidator(private val logger: LimeLogger) {
    fun validate(referenceMap: Map<String, LimeElement>): Boolean {
        val allInterfaces = referenceMap.values.filterIsInstance<LimeInterface>()
        val kotlinInterfaceClasses =
            referenceMap.values.filterIsInstance<LimeClass>().filter {
                it.attributes.have(KOTLIN, INTERFACE)
            }
        val inputCapableTypes = InputCapableTypeResolver.resolve(referenceMap)
        return allInterfaces.all(::validateDirectInternalMembers) &&
            kotlinInterfaceClasses.all { validateKotlinInterfaceClass(it, inputCapableTypes.contains(it.fullName)) }
    }

    /*
     * The interfaces in Kotlin do not allow the usage of 'internal' keyword inside.
     * For LIME elements annotated with '@Internal' we must generate 'internal' keyword for visibility.
     * This would not compile. Therefore, it must be disallowed and the user must know that direct non-static
     * elements and types defined in interface cannot be internal.
     * Moreover, we cannot use 'JvmStatic' compatibility annotation for non-public members of interfaces.
     * Therefore, all static functions and properties must also be taken into account.
     */
    private fun validateDirectInternalMembers(limeInterface: LimeInterface): Boolean {
        val elementsToValidate: List<LimeNamedElement> =
            getDirectNestedTypes(limeInterface) + limeInterface.constants + limeInterface.functions + limeInterface.properties

        return validateNoInternalMembers(elementsToValidate)
    }

    private fun validateKotlinInterfaceClass(
        limeClass: LimeClass,
        isInputCapable: Boolean,
    ): Boolean {
        var isValid = true

        fun reject(
            element: LimeNamedElement,
            reason: String,
        ) {
            logger.error(element, "Kotlin interface generation for LIME classes does not support $reason yet.")
            isValid = false
        }

        if (limeClass.path.hasParent) reject(limeClass, "nested classes")
        if (limeClass.parentClass != null || limeClass.parentInterfaces.isNotEmpty()) reject(limeClass, "inheritance")
        if (limeClass.functions.any { it.isConstructor }) reject(limeClass, "constructors")

        val nestedTypes =
            limeClass.structs + limeClass.enumerations + limeClass.typeAliases +
                limeClass.exceptions + limeClass.classes + limeClass.interfaces + limeClass.lambdas
        if (nestedTypes.isNotEmpty()) reject(limeClass, "nested types")

        val propertiesWithSetters = limeClass.properties.filter { it.setter != null }
        propertiesWithSetters.forEach { reject(it, "writable properties") }

        // A C++ reference must outlive the call. The generated proxy can keep a converted copy of a value that is
        // fixed after the first read ('@Cached'); any other reference would dangle or go stale.
        limeClass.functions.filter { !it.isStatic && !it.isConstructor && it.attributes.have(CPP, REF) }
            .forEach { reject(it, "'@Cpp(Ref)' on functions") }
        limeClass.properties.filter { !it.isStatic && it.attributes.have(CPP, REF) && !it.attributes.have(CACHED) }
            .forEach { reject(it, "'@Cpp(Ref)' on properties that are not '@Cached'") }

        // Kotlin allows only public '@JvmStatic' and '@JvmField' members in an interface companion object.
        val internalStaticMembers: List<LimeNamedElement> =
            (limeClass.functions.filter { it.isStatic } + limeClass.properties.filter { it.isStatic } + limeClass.constants)
                .filter { CommonGeneratorPredicates.isInternal(it, KOTLIN) }
        internalStaticMembers.forEach { reject(it, "'internal' static members and constants") }

        // Nested types are emitted on the contract itself and are unsupported by this generator path.
        val contractMembers: List<LimeNamedElement> = nestedTypes
        if (!validateNoInternalMembers(contractMembers)) isValid = false

        // Internal functions and properties are omitted from the contract and kept on the generated implementation.
        // That is only safe while no application-written implementation can reach native code, because a native
        // caller would otherwise query it for members the contract does not declare.
        if (isInputCapable) {
            val internalMembers: List<LimeNamedElement> =
                (limeClass.functions.filterNot { it.isStatic } + limeClass.properties.filterNot { it.isStatic })
                    .filter { CommonGeneratorPredicates.isInternal(it, KOTLIN) }
            internalMembers.forEach {
                logger.error(
                    it,
                    "Kotlin interface generation does not support 'internal' members on a class that the platform API " +
                        "accepts as an input, because such members cannot be declared on the generated contract.",
                )
                isValid = false
            }
        }

        return isValid
    }

    private fun validateNoInternalMembers(elements: List<LimeNamedElement>): Boolean {
        val internalElements = elements.filter { CommonGeneratorPredicates.isInternal(it, KOTLIN) }
        internalElements.forEach {
            logger.error(it, "Kotlin language does not allow children elements to use 'internal' visibility in interfaces!")
        }
        return internalElements.isEmpty()
    }

    private fun getDirectNestedTypes(limeInterface: LimeInterface): List<LimeNamedElement> {
        return limeInterface.structs + limeInterface.enumerations + limeInterface.typeAliases +
            limeInterface.exceptions + limeInterface.classes + limeInterface.interfaces + limeInterface.lambdas
    }
}
