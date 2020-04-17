/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

package com.here.gluecodium.generator.common

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypesCollection

class LimeModelFilter(private val predicate: (LimeNamedElement) -> Boolean) {
    fun filter(elements: List<LimeNamedElement>) =
        elements.filter(predicate).map { filterElement(it) }

    private fun filterElement(element: LimeNamedElement) =
        when (element) {
            is LimeClass -> filterClass(element)
            is LimeInterface -> filterInterface(element)
            is LimeTypesCollection -> filterTypesCollection(element)
            is LimeStruct -> filterStruct(element)
            is LimeEnumeration -> filterEnum(element)
            else -> element
        }

    private fun filterClass(limeClass: LimeClass): LimeClass =
        limeClass.run { LimeClass(
            path = path,
            visibility = visibility,
            comment = comment,
            attributes = attributes,
            structs = structs.filter(predicate).map { filterStruct(it) },
            enumerations = enumerations.filter(predicate).map { filterEnum(it) },
            constants = constants.filter(predicate),
            typeAliases = typeAliases.filter(predicate),
            functions = functions.filter(predicate),
            properties = properties.filter(predicate),
            exceptions = exceptions.filter(predicate),
            classes = classes.filter(predicate).map { filterClass(it) },
            interfaces = interfaces.filter(predicate).map { filterInterface(it) },
            lambdas = lambdas.filter(predicate),
            parent = parent
        ) }

    private fun filterInterface(limeInterface: LimeInterface): LimeInterface =
        limeInterface.run { LimeInterface(
            path = path,
            visibility = visibility,
            comment = comment,
            attributes = attributes,
            structs = structs.filter(predicate).map { filterStruct(it) },
            enumerations = enumerations.filter(predicate).map { filterEnum(it) },
            constants = constants.filter(predicate),
            typeAliases = typeAliases.filter(predicate),
            functions = functions.filter(predicate),
            properties = properties.filter(predicate),
            exceptions = exceptions.filter(predicate),
            classes = classes.filter(predicate).map { filterClass(it) },
            interfaces = interfaces.filter(predicate).map { filterInterface(it) },
            lambdas = lambdas.filter(predicate),
            parent = parent
        ) }

    private fun filterTypesCollection(limeTypes: LimeTypesCollection) =
        limeTypes.run { LimeTypesCollection(
            path = path,
            visibility = visibility,
            comment = comment,
            attributes = attributes,
            structs = structs.filter(predicate).map { filterStruct(it) },
            enumerations = enumerations.filter(predicate).map { filterEnum(it) },
            constants = constants.filter(predicate),
            typeAliases = typeAliases.filter(predicate),
            exceptions = exceptions.filter(predicate)
        ) }

    private fun filterStruct(limeStruct: LimeStruct) =
        limeStruct.run { LimeStruct(
            path = path,
            visibility = visibility,
            comment = comment,
            attributes = attributes,
            functions = functions.filter(predicate),
            constants = constants.filter(predicate),
            fields = fields.filter(predicate),
            constructorComment = constructorComment
        ) }

    private fun filterEnum(limeEnum: LimeEnumeration) =
        limeEnum.run { LimeEnumeration(
            path = path,
            visibility = visibility,
            comment = comment,
            attributes = attributes,
            enumerators = enumerators.filter(predicate)
        ) }
}
