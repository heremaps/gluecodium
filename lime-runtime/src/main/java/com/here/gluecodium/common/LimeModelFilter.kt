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

package com.here.gluecodium.common

import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeDirectTypeRef
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePositionalEnumeratorRef
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue

object LimeModelFilter {
    fun filter(limeModel: LimeModel, predicate: (LimeNamedElement) -> Boolean) =
        LimeModelFilterImpl(limeModel, predicate).filter()
}

private class LimeModelFilterImpl(private val limeModel: LimeModel, predicate: (LimeNamedElement) -> Boolean) {

    private val referenceMap = limeModel.referenceMap.toMutableMap()
    private val droppedElements = mutableSetOf<String>()

    private val predicate: (LimeNamedElement) -> Boolean = {
        predicate(it).also { result ->
            if (!result) {
                droppedElements += it.fullName
                if (it.path.disambiguator.isNotEmpty()) {
                    droppedElements += it.path.withSuffix("").toString()
                }
            }
        }
    }

    fun filter(): LimeModel {
        val topElements = limeModel.topElements.filter(predicate).map { filterTopElement(it) }
        val auxiliaryElements = limeModel.auxiliaryElements.filter(predicate).map { filterTopElement(it) }

        // Has to be filtered last, when [droppedElements] is already filled.
        val referenceMap = referenceMap.filterValues { refMapPredicate(it) }.toMutableMap()
        // Restore ambiguous keys if some of the non-ambiguous entries are still present.
        referenceMap.entries
            .filter { it.key.contains(":") }
            .sortedBy { it.key }
            .forEach { referenceMap.putIfAbsent(it.key.split(":").first(), it.value) }

        return LimeModel(referenceMap, topElements, auxiliaryElements, limeModel.fileNameMap)
    }

    private fun refMapPredicate(limeElement: LimeElement) =
        when {
            limeElement !is LimeNamedElement -> true
            droppedElements.contains(limeElement.fullName) -> false
            limeElement.path.tailParents.any { droppedElements.contains(it.toString()) } -> false
            else -> true
        }

    private fun filterTopElement(element: LimeNamedElement) =
        when (element) {
            is LimeClass -> filterClass(element)
            is LimeInterface -> filterInterface(element)
            is LimeTypesCollection -> filterTypesCollection(element)
            is LimeStruct -> filterStruct(element)
            is LimeEnumeration -> filterEnum(element)
            else -> element
        }

    private fun <T : LimeNamedElement> remap(element: T) {
        referenceMap[element.fullName] = element
        if (element.path.disambiguator.isNotEmpty()) {
            referenceMap.replace(element.path.withSuffix("").toString(), element)
        }
    }

    private fun filterClass(limeClass: LimeClass): LimeClass =
        limeClass.run {
            LimeClass(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                structs = structs.filter(predicate).map { filterStruct(it) },
                enumerations = enumerations.filter(predicate).map { filterEnum(it) },
                constants = constants.filter(predicate).map { filterConstant(it) },
                typeAliases = typeAliases.filter(predicate),
                functions = functions.filter(predicate),
                properties = properties.filter(predicate),
                exceptions = exceptions.filter(predicate),
                classes = classes.filter(predicate).map { filterClass(it) },
                interfaces = interfaces.filter(predicate).map { filterInterface(it) },
                lambdas = lambdas.filter(predicate),
                parent = parent?.let { LimeDirectTypeRef(filterTopElement(it.type.actualType) as LimeType) }
            )
        }.also { remap(it) }

    private fun filterInterface(limeInterface: LimeInterface): LimeInterface =
        limeInterface.run {
            LimeInterface(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                structs = structs.filter(predicate).map { filterStruct(it) },
                enumerations = enumerations.filter(predicate).map { filterEnum(it) },
                constants = constants.filter(predicate).map { filterConstant(it) },
                typeAliases = typeAliases.filter(predicate),
                functions = functions.filter(predicate),
                properties = properties.filter(predicate),
                exceptions = exceptions.filter(predicate),
                classes = classes.filter(predicate).map { filterClass(it) },
                interfaces = interfaces.filter(predicate).map { filterInterface(it) },
                lambdas = lambdas.filter(predicate),
                parent = parent?.let { LimeDirectTypeRef(filterTopElement(it.type.actualType) as LimeType) }
            )
        }.also { remap(it) }

    private fun filterTypesCollection(limeTypes: LimeTypesCollection) =
        limeTypes.run {
            LimeTypesCollection(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                structs = structs.filter(predicate).map { filterStruct(it) },
                enumerations = enumerations.filter(predicate).map { filterEnum(it) },
                constants = constants.filter(predicate).map { filterConstant(it) },
                typeAliases = typeAliases.filter(predicate),
                exceptions = exceptions.filter(predicate)
            )
        }.also { remap(it) }

    private fun filterStruct(limeStruct: LimeStruct) =
        limeStruct.run {
            LimeStruct(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                functions = functions.filter(predicate),
                exceptions = exceptions.filter(predicate),
                constants = constants.filter(predicate).map { filterConstant(it) },
                fields = fields.filter(predicate).map { filterField(it) },
                constructorComment = constructorComment,
                structs = structs.filter(predicate),
                classes = classes.filter(predicate),
                interfaces = interfaces.filter(predicate),
                enumerations = enumerations.filter(predicate),
                fieldConstructors = fieldConstructors.filter(predicate)
            )
        }.also { remap(it) }

    private fun filterEnum(limeEnum: LimeEnumeration) =
        limeEnum.run {
            val filteredEnumerators = enumerators.filter(predicate)
            val relinkedEnumerators = filteredEnumerators.mapIndexed { idx, it ->
                LimeEnumerator(
                    path = it.path,
                    comment = it.comment,
                    attributes = it.attributes,
                    explicitValue = it.explicitValue,
                    previous = filteredEnumerators.getOrNull(idx - 1)
                )
            }

            LimeEnumeration(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                enumerators = relinkedEnumerators
            )
        }.also { remap(it) }

    private fun filterConstant(limeConstant: LimeConstant) =
        limeConstant.run {
            LimeConstant(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                typeRef = typeRef,
                value = filterValue(value)
            )
        }.also { remap(it) }

    private fun filterField(limeField: LimeField) =
        limeField.run {
            LimeField(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                typeRef = typeRef,
                defaultValue = defaultValue?.let { filterValue(it) }
            )
        }.also { remap(it) }

    private fun filterValue(limeValue: LimeValue): LimeValue {
        if (limeValue !is LimeValue.Enumerator || limeValue.valueRef !is LimePositionalEnumeratorRef) return limeValue
        val limeEnumeration = limeValue.typeRef.type.actualType as? LimeEnumeration ?: return limeValue

        val filteredTypeRef = LimeDirectTypeRef(filterEnum(limeEnumeration))
        return LimeValue.Enumerator(filteredTypeRef, limeValue.valueRef.remap(filteredTypeRef))
    }
}
