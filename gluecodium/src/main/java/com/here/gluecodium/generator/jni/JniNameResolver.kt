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

package com.here.gluecodium.generator.jni

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.generator.common.NameResolver
import com.here.gluecodium.generator.common.ReferenceMapBasedResolver
import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.model.lime.LimeAttributeType.CACHED
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeAttributeValueType.FUNCTION_NAME
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeExternalDescriptor
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeReturnType
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypedElement
import com.here.gluecodium.model.lime.LimeTypesCollection

internal class JniNameResolver(
    limeReferenceMap: Map<String, LimeElement>,
    private val basePackages: List<String>,
    private val javaNameRules: JavaNameRules
) : ReferenceMapBasedResolver(limeReferenceMap), NameResolver {

    override fun resolveName(element: Any): String =
        when (element) {
            is String -> createJavaTypePath(element)
            is LimeType -> resolveTypeName(element)
            is LimeTypeRef -> resolveTypeRef(element)
            is LimeReturnType -> resolveTypeRef(element.typeRef)
            is LimeFunction -> resolveFunctionName(element)
            is LimeNamedElement -> javaNameRules.getName(element)
            else ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
        }

    override fun resolveGetterName(element: Any) = resolveAccessorName(element) { getGetterName(it) }

    override fun resolveSetterName(element: Any) = resolveAccessorName(element) { getSetterName(it) }

    // Narrow usage: only for intermediate types for "external" types with converters.
    override fun resolveReferenceName(element: Any) =
        when {
            element !is LimeType ->
                throw GluecodiumExecutionException("Unsupported element type ${element.javaClass.name}")
            element.external?.java?.get(CONVERTER_NAME) == null -> resolveTypeName(element)
            else -> createJavaTypePath(basePackages + element.path.head, resolveNestedNames(element))
        }

    private fun resolveAccessorName(element: Any, rule: JavaNameRules.(LimeTypedElement) -> String): String? {
        val limeTypedElement = element as? LimeTypedElement ?: return null
        return javaNameRules.rule(limeTypedElement) +
            if (limeTypedElement.attributes.have(CACHED)) "_private" else ""
    }

    private fun resolveTypeRef(limeTypeRef: LimeTypeRef): String {
        val limeType = limeTypeRef.type.actualType
        return when {
            limeType is LimeException -> "jthrowable"
            limeType !is LimeBasicType -> "jobject"
            limeTypeRef.isNullable -> resolveNullableBasicType(limeType.typeId)
            else -> resolveBasicType(limeType.typeId)
        }
    }

    private fun resolveTypeName(limeType: LimeType) =
        when (val actualType = limeType.actualType) {
            is LimeList -> "java/util/List"
            is LimeSet -> "java/util/Set"
            is LimeMap -> "java/util/Map"
            else -> limeType.external?.java?.get(LimeExternalDescriptor.NAME_NAME)?.let { createJavaTypePath(it) }
                ?: createJavaTypePath(basePackages + actualType.path.head, resolveNestedNames(actualType))
        }

    private fun createJavaTypePath(importString: String) =
        createJavaTypePath(
            JavaNameRules.getPackageFromImportString(importString),
            JavaNameRules.getClassNamesFromImportString(importString)
        )

    private fun createJavaTypePath(packageNames: List<String>, classNames: List<String>): String {
        val fixedPackageNames = packageNames.map { it.replace("_", "") }
        return (fixedPackageNames + classNames.joinToString("$")).joinToString("/")
    }

    private fun resolveFunctionName(limeFunction: LimeFunction): String {
        val parentLambda = getParentElement(limeFunction) as? LimeLambda ?: return javaNameRules.getName(limeFunction)
        return parentLambda.attributes.get(JAVA, FUNCTION_NAME) ?: "apply"
    }

    private fun resolveNestedNames(limeElement: LimeNamedElement): List<String> {
        val elementName = javaNameRules.getName(limeElement)
        val parentElement = if (limeElement.path.hasParent) getParentElement(limeElement) else null
        return when (parentElement) {
            null, is LimeTypesCollection -> listOf(elementName)
            else -> resolveNestedNames(parentElement) + elementName
        }
    }

    private fun resolveNullableBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.STRING -> "jstring"
            TypeId.BLOB -> "jbyteArray"
            else -> "jobject"
        }

    private fun resolveBasicType(typeId: TypeId) =
        when (typeId) {
            TypeId.VOID -> "void"
            TypeId.INT8 -> "jbyte"
            TypeId.UINT8, TypeId.INT16 -> "jshort"
            TypeId.UINT16, TypeId.INT32 -> "jint"
            TypeId.UINT32, TypeId.INT64, TypeId.UINT64 -> "jlong"
            TypeId.BOOLEAN -> "jboolean"
            TypeId.FLOAT -> "jfloat"
            TypeId.DOUBLE -> "jdouble"
            TypeId.STRING -> "jstring"
            TypeId.BLOB -> "jbyteArray"
            TypeId.DATE, TypeId.LOCALE -> "jobject"
        }
}
