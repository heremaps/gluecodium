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

package com.here.genium.generator.cpp

import com.here.genium.generator.common.NameRules
import com.here.genium.generator.common.VerbatimNameRules
import com.here.genium.model.lime.LimeAttributeType
import com.here.genium.model.lime.LimeBasicType
import com.here.genium.model.lime.LimeBasicType.TypeId
import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeContainer.ContainerType
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeNamedElement
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeTypeHelper
import java.util.HashMap
import java.util.function.BiFunction

class CppNameResolver(
    rootNamespace: List<String>,
    private val limeReferenceMap: Map<String, LimeElement>
) {
    private val rootNamespace: String = rootNamespace.joinToString("::")
    private val namesCache = HashMap<String, NamesCacheEntry>()

    private class NamesCacheEntry(
        val isExternal: Boolean,
        val shortName: String,
        val fullName: String
    )

    fun getName(limeElement: LimeNamedElement) = getCachedEntry(limeElement).shortName

    fun getFullyQualifiedName(limeElement: LimeNamedElement) = getCachedEntry(limeElement).fullName

    fun getGetterName(limeProperty: LimeProperty) =
        limeProperty.attributes.get(
            LimeAttributeType.EXTERNAL_GETTER,
            String::class.java
        ) ?: (CppNameRules.getGetterPrefix(isBooleanProperty(limeProperty)) + getName(limeProperty))

    fun getSetterName(limeProperty: LimeProperty): String {
        return limeProperty.attributes.get(LimeAttributeType.EXTERNAL_SETTER, String::class.java)
            ?: (CppNameRules.setterPrefix + getName(limeProperty))
    }

    fun getFullyQualifiedGetterName(limeProperty: LimeProperty) =
        getParentFullName(limeProperty) + "::" + getGetterName(limeProperty)

    fun getFullyQualifiedSetterName(limeProperty: LimeProperty) =
        getParentFullName(limeProperty) + "::" + getSetterName(limeProperty)

    private fun getCachedEntry(limeElement: LimeNamedElement) =
        namesCache.getOrPut(limeElement.fullName) { resolveNames(limeElement) }

    private fun getParentFullName(limeElement: LimeNamedElement): String {
        val parentPath = limeElement.path.parent.toString()
        val parentElement = limeReferenceMap[parentPath] as? LimeNamedElement
        return if (parentElement != null) getCachedEntry(parentElement).fullName else ""
    }

    private fun resolveNames(limeElement: LimeNamedElement): NamesCacheEntry {
        var parentPath = limeElement.path.parent
        var parentElement = limeReferenceMap[parentPath.toString()] as? LimeNamedElement
        if (parentElement is LimeContainer &&
            parentElement.type === ContainerType.TYPE_COLLECTION) {
            // A type collection doesn't correspond to any named entity in C++ generated code.
            // So skip it and use the parent namespace instead.
            parentPath = parentPath.parent
            parentElement = null
        }

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

        val isExternal =
            parentIsExternal || limeElement.attributes.have(LimeAttributeType.EXTERNAL_TYPE)
        val externalName =
            limeElement.attributes.get(LimeAttributeType.EXTERNAL_NAME, String::class.java)

        return if (externalName != null) {
            NamesCacheEntry(isExternal, externalName, externalName)
        } else {
            val name = selectNameRule(limeElement).apply(
                if (isExternal) VerbatimNameRules else CppNameRules,
                limeElement.name
            )
            NamesCacheEntry(isExternal, name, "$parentFullName::$name")
        }
    }

    private fun selectNameRule(limeElement: LimeElement) =
        when (limeElement) {
            is LimeField, is LimeParameter -> BiFunction(NameRules::getVariableName)
            is LimeConstant, is LimeEnumerator -> BiFunction(NameRules::getConstantName)
            is LimeMethod, is LimeProperty -> BiFunction(NameRules::getFunctionName)
            else -> BiFunction(NameRules::getTypeName)
        }

    private fun isBooleanProperty(limeProperty: LimeProperty): Boolean {
        val type = LimeTypeHelper.getActualType(limeProperty.typeRef.type)
        return type is LimeBasicType && type.typeId == TypeId.BOOLEAN
    }
}
