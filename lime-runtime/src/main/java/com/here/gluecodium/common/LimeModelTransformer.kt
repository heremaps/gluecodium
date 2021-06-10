/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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

class LimeModelTransformer(private val limeModel: LimeModel, transformer: (LimeNamedElement) -> LimeNamedElement?) {

    private val droppedElements = mutableSetOf<String>()

    private val transformer: (LimeNamedElement) -> LimeNamedElement? = {
        transformer(it).also { result ->
            if (result == null) {
                droppedElements += it.fullName
                if (it.path.disambiguator.isNotEmpty()) {
                    droppedElements += it.path.withSuffix("").toString()
                }
            }
        }
    }

    private inline fun <reified T : LimeNamedElement> transformList(elements: List<T>) =
        elements.mapNotNull(transformer).filterIsInstance<T>()

    fun transform(): LimeModel {
        val topElements = transformList(limeModel.topElements).map { transformTopElement(it) }
        val auxiliaryElements = transformList(limeModel.auxiliaryElements).map { transformTopElement(it) }
        // Reference map to be filtered last, when [droppedElements] is already filled.
        val referenceMap = limeModel.referenceMap.filterValues { refMapFilterPredicate(it) }

        return LimeModel(referenceMap, topElements, auxiliaryElements, limeModel.fileNameMap)
    }

    private fun refMapFilterPredicate(limeElement: LimeElement) =
        when {
            limeElement !is LimeNamedElement -> true
            droppedElements.contains(limeElement.fullName) -> false
            limeElement.path.tailParents.any { droppedElements.contains(it.toString()) } -> false
            else -> true
        }

    private fun transformTopElement(element: LimeNamedElement) =
        when (element) {
            is LimeClass -> transformClass(element)
            is LimeInterface -> transformInterface(element)
            is LimeTypesCollection -> transformTypesCollection(element)
            is LimeStruct -> transformStruct(element)
            is LimeEnumeration -> transformEnum(element)
            else -> element
        }

    private fun transformClass(limeClass: LimeClass): LimeClass =
        limeClass.run {
            LimeClass(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                structs = transformList(structs).map { transformStruct(it) },
                enumerations = transformList(enumerations).map { transformEnum(it) },
                constants = transformList(constants).map { transformConstant(it) },
                typeAliases = transformList(typeAliases),
                functions = transformList(functions),
                properties = transformList(properties),
                exceptions = transformList(exceptions),
                classes = transformList(classes).map { transformClass(it) },
                interfaces = transformList(interfaces).map { transformInterface(it) },
                lambdas = transformList(lambdas),
                parent = parent?.let { LimeDirectTypeRef(transformTopElement(it.type.actualType) as LimeType) }
            )
        }

    private fun transformInterface(limeInterface: LimeInterface): LimeInterface =
        limeInterface.run {
            LimeInterface(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                structs = transformList(structs).map { transformStruct(it) },
                enumerations = transformList(enumerations).map { transformEnum(it) },
                constants = transformList(constants).map { transformConstant(it) },
                typeAliases = transformList(typeAliases),
                functions = transformList(functions),
                properties = transformList(properties),
                exceptions = transformList(exceptions),
                classes = transformList(classes).map { transformClass(it) },
                interfaces = transformList(interfaces).map { transformInterface(it) },
                lambdas = transformList(lambdas),
                parent = parent?.let { LimeDirectTypeRef(transformTopElement(it.type.actualType) as LimeType) }
            )
        }

    private fun transformTypesCollection(limeTypes: LimeTypesCollection) =
        limeTypes.run {
            LimeTypesCollection(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                structs = transformList(structs).map { transformStruct(it) },
                enumerations = transformList(enumerations).map { transformEnum(it) },
                constants = transformList(constants).map { transformConstant(it) },
                typeAliases = transformList(typeAliases),
                exceptions = transformList(exceptions)
            )
        }

    private fun transformStruct(limeStruct: LimeStruct) =
        limeStruct.run {
            LimeStruct(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                functions = transformList(functions),
                exceptions = transformList(exceptions),
                constants = transformList(constants).map { transformConstant(it) },
                fields = transformList(fields).map { transformField(it) },
                constructorComment = constructorComment,
                structs = transformList(structs),
                classes = transformList(classes),
                interfaces = transformList(interfaces),
                enumerations = transformList(enumerations)
            )
        }

    private fun transformEnum(limeEnum: LimeEnumeration) =
        limeEnum.run {
            val transformedEnumerators = transformList(enumerators)
            val relinkedEnumerators = transformedEnumerators.mapIndexed { idx, it ->
                LimeEnumerator(
                    path = it.path,
                    comment = it.comment,
                    attributes = it.attributes,
                    explicitValue = it.explicitValue,
                    previous = transformedEnumerators.getOrNull(idx - 1)
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
        }

    private fun transformConstant(limeConstant: LimeConstant) =
        limeConstant.run {
            LimeConstant(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                typeRef = typeRef,
                value = transformValue(value)
            )
        }

    private fun transformField(limeField: LimeField) =
        limeField.run {
            LimeField(
                path = path,
                visibility = visibility,
                comment = comment,
                attributes = attributes,
                external = external,
                typeRef = typeRef,
                defaultValue = defaultValue?.let { transformValue(it) }
            )
        }

    private fun transformValue(limeValue: LimeValue): LimeValue {
        if (limeValue !is LimeValue.Enumerator || limeValue.valueRef !is LimePositionalEnumeratorRef) return limeValue
        val limeEnumeration = limeValue.typeRef.type.actualType as? LimeEnumeration ?: return limeValue

        val transformedTypeRef = LimeDirectTypeRef(transformEnum(limeEnumeration))
        return LimeValue.Enumerator(transformedTypeRef, limeValue.valueRef.remap(transformedTypeRef))
    }
}
