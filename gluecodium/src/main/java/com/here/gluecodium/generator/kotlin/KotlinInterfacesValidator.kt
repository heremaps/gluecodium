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
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeNamedElement

internal class KotlinInterfacesValidator(private val logger: LimeLogger) {
    fun validate(referenceMap: Map<String, LimeElement>): Boolean {
        val allInterfaces = referenceMap.values.filterIsInstance<LimeInterface>()
        return !allInterfaces.map { validateDirectInternalMembers(it) }.contains(false)
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
            getDirectNestedTypes(limeInterface) + limeInterface.functions + limeInterface.properties

        val containsDirectInternalElement =
            elementsToValidate.map {
                val isInternal = CommonGeneratorPredicates.isInternal(it, KOTLIN)
                if (isInternal) {
                    val errorMessage = "Kotlin language does not allow children elements to use 'internal' visibility in interfaces!"
                    logger.error(it, errorMessage)
                }

                isInternal
            }.contains(true)

        return !containsDirectInternalElement
    }

    private fun getDirectNestedTypes(limeInterface: LimeInterface): List<LimeNamedElement> {
        return limeInterface.structs + limeInterface.enumerations + limeInterface.typeAliases +
            limeInterface.exceptions + limeInterface.classes + limeInterface.interfaces + limeInterface.lambdas
    }
}
