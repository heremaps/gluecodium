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

import com.here.gluecodium.common.LimeModelSkipPredicates
import com.here.gluecodium.generator.common.CommonGeneratorPredicates
import com.here.gluecodium.generator.cpp.CppNameResolver
import com.here.gluecodium.generator.cpp.CppNameRules
import com.here.gluecodium.generator.cpp.CppSignatureResolver
import com.here.gluecodium.generator.java.JavaNameRules
import com.here.gluecodium.generator.java.JavaSignatureResolver
import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeType.JAVA
import com.here.gluecodium.model.lime.LimeBasicType
import com.here.gluecodium.model.lime.LimeBasicType.TypeId.BOOLEAN
import com.here.gluecodium.model.lime.LimeBasicType.TypeId.VOID
import com.here.gluecodium.model.lime.LimeClass
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeExternalDescriptor.Companion.CONVERTER_NAME
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeRef

/**
 * List of predicates used by `ifPredicate`/`unlessPredicate` template helpers in JNI generator.
 */
internal class JniGeneratorPredicates(
    private val limeReferenceMap: Map<String, LimeElement>,
    javaNameRules: JavaNameRules,
    cppNameRules: CppNameRules,
    cppNameResolver: CppNameResolver,
    private val activeTags: Set<String>,
) {
    private val javaSignatureResolver = JavaSignatureResolver(limeReferenceMap, javaNameRules, activeTags)
    private val cppSignatureResolver = CppSignatureResolver(limeReferenceMap, cppNameRules)
    private val overloadedLambdas = collectOverloadedLambdas()

    val predicates =
        mapOf(
            "hasConstructors" to { limeContainer: Any ->
                limeContainer is LimeContainer && limeContainer.functions.any { it.isConstructor }
            },
            "hasCppGetter" to { limeField: Any ->
                limeField is LimeField && cppNameResolver.resolveGetterName(limeField) != null
            },
            "hasCppSetter" to { limeField: Any ->
                limeField is LimeField && cppNameResolver.resolveSetterName(limeField) != null
            },
            "hasImmutableFields" to { CommonGeneratorPredicates.hasImmutableFields(it) },
            "hasOverloadedLambda" to { limeType: Any ->
                when (limeType) {
                    is LimeLambda -> isOverloadedLambda(limeType)
                    is LimeList -> isOverloadedLambda(limeType.elementType.type.actualType)
                    is LimeMap -> isOverloadedLambda(limeType.valueType.type.actualType)
                    else -> false
                }
            },
            "hasTypeRepository" to { CommonGeneratorPredicates.hasTypeRepository(it) },
            "isJniPrimitive" to

                fun(limeTypeRef: Any): Boolean {
                    if (limeTypeRef !is LimeTypeRef || limeTypeRef.isNullable) return false

                    val limeType = limeTypeRef.type.actualType
                    if (limeType !is LimeBasicType) return false

                    val typeId = limeType.typeId
                    return typeId.isNumericType || typeId == VOID || typeId == BOOLEAN
                },
            "isOverloaded" to { limeFunction: Any ->
                limeFunction is LimeFunction && javaSignatureResolver.isOverloadedInBindings(limeFunction)
            },
            "needsOrdinalConversion" to

                fun(limeEnumeration: Any): Boolean {
                    if (limeEnumeration !is LimeEnumeration) return false
                    val descriptor = limeEnumeration.external?.java ?: return false
                    return !descriptor.containsKey(CONVERTER_NAME)
                },
            "needsRefSuffix" to { limeTypeRef: Any ->
                limeTypeRef is LimeTypeRef && CppNameResolver.needsRefSuffix(limeTypeRef)
            },
            "returnsOpaqueHandle" to { limeFunction: Any ->
                limeFunction is LimeFunction && limeFunction.isConstructor &&
                    limeFunction.returnType.typeRef.type is LimeClass
            },
            "shouldRetain" to { limeElement: Any ->
                limeElement is LimeNamedElement && shouldRetain(limeElement)
            },
        )

    fun shouldRetain(limeElement: LimeNamedElement) =
        LimeModelSkipPredicates.shouldRetainCheckParent(limeElement, activeTags, JAVA, limeReferenceMap)

    private fun collectOverloadedLambdas(): Set<String> {
        val lambdas = limeReferenceMap.values.filterIsInstance<LimeLambda>()
        val signatureMap = lambdas.groupBy { cppSignatureResolver.getSignature(it) }
        val overloadedLambdas = signatureMap.values.filter { it.size > 1 }.flatten()
        val attributeLambdas = lambdas.filter { it.attributes.have(LimeAttributeType.OVERLOADED) }
        return (overloadedLambdas + attributeLambdas).map { it.path.toString() }.toSet()
    }

    private fun isOverloadedLambda(limeType: LimeType) = limeType is LimeLambda && overloadedLambdas.contains(limeType.path.toString())

    companion object {
        fun hasThrowingFunctions(limeElement: LimeNamedElement) =
            when (limeElement) {
                is LimeContainerWithInheritance -> limeElement.functions + limeElement.inheritedFunctions
                is LimeContainer -> limeElement.functions
                else -> emptyList()
            }.any { it.thrownType != null }
    }
}
