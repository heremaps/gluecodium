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

package com.here.gluecodium.generator.cpp

import com.here.gluecodium.model.lime.LimeAttributeType.CPP
import com.here.gluecodium.model.lime.LimeAttributeValueType.NAME
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.GETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.NAME_NAME
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.SETTER_NAME_NAME
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeProperty
import java.util.HashMap

internal class CppNameCache(
    rootNamespace: List<String>,
    private val limeReferenceMap: Map<String, LimeElement>,
    val nameRules: CppNameRules,
) {
    private val rootNamespace: String = rootNamespace.joinToString("::")
    private val namesCache = HashMap<String, NamesCacheEntry>()

    private class NamesCacheEntry(
        val isExternal: Boolean,
        val shortName: String,
        val fullName: String,
    )

    fun getName(limeElement: LimeNamedElement) = getCachedEntry(limeElement).shortName

    fun getFullyQualifiedName(limeElement: LimeNamedElement) = getCachedEntry(limeElement).fullName

    fun getGetterName(limeProperty: LimeProperty) =
        limeProperty.getter.external?.cpp?.get(NAME_NAME)
            ?: limeProperty.getter.attributes.get(CPP, NAME)
            ?: nameRules.getGetterName(limeProperty)

    fun getSetterName(limeProperty: LimeProperty) =
        limeProperty.setter?.external?.cpp?.get(NAME_NAME)
            ?: limeProperty.setter?.attributes?.get(CPP, NAME)
            ?: nameRules.getSetterName(limeProperty)

    fun getGetterName(limeField: LimeField) = limeField.external?.cpp?.get(GETTER_NAME_NAME) ?: nameRules.getGetterName(limeField)

    fun getSetterName(limeField: LimeField) = limeField.external?.cpp?.get(SETTER_NAME_NAME) ?: nameRules.getSetterName(limeField)

    fun getFullyQualifiedGetterName(limeProperty: LimeProperty) = getParentFullName(limeProperty) + "::" + getGetterName(limeProperty)

    fun getFullyQualifiedSetterName(limeProperty: LimeProperty) = getParentFullName(limeProperty) + "::" + getSetterName(limeProperty)

    private fun getCachedEntry(limeElement: LimeNamedElement) = namesCache.getOrPut(limeElement.fullName) { resolveNames(limeElement) }

    private fun getParentFullName(limeElement: LimeNamedElement): String {
        val parentPath = limeElement.path.parent.toString()
        val parentElement = limeReferenceMap[parentPath] as? LimeNamedElement
        return if (parentElement != null) getCachedEntry(parentElement).fullName else ""
    }

    private fun resolveNames(limeElement: LimeNamedElement): NamesCacheEntry {
        val parentPath = limeElement.path.parent
        val parentElement = limeReferenceMap[parentPath.toString()] as? LimeNamedElement

        val parentFullName: String
        var parentIsExternal = false
        if (parentElement != null) {
            val parentCacheEntry = getCachedEntry(parentElement)
            parentIsExternal = parentCacheEntry.isExternal
            parentFullName = parentCacheEntry.fullName
        } else {
            val rootPrefix = "::" + rootNamespace + (if (rootNamespace.isEmpty()) "" else "::")
            parentFullName = rootPrefix + parentPath.head.joinToString(separator = "::")
        }

        val isExternal = parentIsExternal || limeElement.external?.cpp != null
        val externalName = limeElement.external?.cpp?.get(NAME_NAME)
        val platformName = limeElement.attributes.get(CPP, NAME)

        val name =
            when {
                externalName != null -> externalName
                platformName != null -> platformName
                isExternal -> limeElement.name
                else -> nameRules.getName(limeElement)
            }
        val fullName =
            when {
                externalName != null -> externalName
                else -> "$parentFullName::$name"
            }

        return NamesCacheEntry(isExternal, name, fullName)
    }
}
