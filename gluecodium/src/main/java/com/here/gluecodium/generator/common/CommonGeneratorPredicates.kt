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

import com.here.gluecodium.model.lime.LimeAttributeType
import com.here.gluecodium.model.lime.LimeAttributeValueType
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFieldConstructor
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeInterface
import com.here.gluecodium.model.lime.LimeLazyFunctionCall
import com.here.gluecodium.model.lime.LimeList
import com.here.gluecodium.model.lime.LimeMap
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeSet
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeType
import com.here.gluecodium.model.lime.LimeTypeAlias

/**
 * Predicates used by `ifPredicate`/`unlessPredicate` template helpers in several generators.
 */
internal object CommonGeneratorPredicates {
    fun hasAnyComment(
        limeElement: Any,
        platformTag: String,
    ) = when (limeElement) {
        is LimeFunction ->
            limeElement.run {
                comment.getFor(platformTag).isNotBlank() || comment.isExcluded ||
                    returnType.comment.getFor(platformTag).isNotBlank() ||
                    (thrownType?.comment?.getFor(platformTag)?.isEmpty() == false) ||
                    attributes.have(LimeAttributeType.DEPRECATED) ||
                    parameters.any { it.comment.getFor(platformTag).isNotBlank() }
            }
        is LimeFieldConstructor ->
            limeElement.run {
                comment.getFor(platformTag).isNotBlank() || comment.isExcluded ||
                    attributes.have(LimeAttributeType.DEPRECATED) ||
                    struct.constructorComment.getFor(platformTag).isNotBlank()
            }
        is LimeNamedElement ->
            limeElement.run {
                comment.getFor(platformTag).isNotBlank() || comment.isExcluded ||
                    attributes.have(LimeAttributeType.DEPRECATED)
            }
        else -> false
    }

    fun hasImmutableFields(limeStruct: Any) =
        when {
            limeStruct !is LimeStruct -> false
            limeStruct.attributes.have(LimeAttributeType.IMMUTABLE) -> true
            else ->
                limeStruct.fields
                    .flatMap { getAllFieldTypes(it.typeRef.type) }
                    .any { it.attributes.have(LimeAttributeType.IMMUTABLE) }
        }

    fun hasTypeRepository(limeContainer: Any) =
        when {
            limeContainer !is LimeContainerWithInheritance -> false
            limeContainer is LimeInterface -> !limeContainer.isNarrow
            limeContainer.isOpen -> true
            else -> limeContainer.parents.isNotEmpty()
        }

    fun hasStaticFunctions(limeContainer: Any) =
        when {
            limeContainer !is LimeContainer -> false
            limeContainer.functions.any { it.isStatic } -> true
            limeContainer.properties.any { it.isStatic } -> true
            else -> false
        }

    fun needsImportsForSkippedField(
        limeElement: LimeNamedElement,
        platformAttribute: LimeAttributeType,
        referenceMap: Map<String, LimeElement>,
    ): Boolean {
        if (limeElement !is LimeField) return false
        if (!limeElement.attributes.have(platformAttribute, LimeAttributeValueType.SKIP)) return false
        val parentKey = limeElement.path.parent.toString()
        val limeStruct = referenceMap[parentKey] as? LimeStruct ?: return false
        return hasImmutableFields(limeStruct)
    }

    fun isInternal(
        limeElement: LimeNamedElement,
        platformAttribute: LimeAttributeType,
    ) = when {
        limeElement.attributes.have(platformAttribute, LimeAttributeValueType.PUBLIC) -> false
        limeElement.attributes.have(platformAttribute, LimeAttributeValueType.INTERNAL) -> true
        else -> limeElement.attributes.have(LimeAttributeType.INTERNAL)
    }

    fun isExceptionSameForCtorAndHookFun(ctor: LimeFunction): Boolean {
        if (!ctor.isConstructor || ctor.thrownType == null || !ctor.attributes.have(LimeAttributeType.AFTER_CONSTRUCTION)) {
            return false
        }

        val hookFun =
            ctor.attributes.get(
                LimeAttributeType.AFTER_CONSTRUCTION,
                LimeAttributeValueType.FUNCTION,
                LimeLazyFunctionCall::class.java,
            )?.function

        if (hookFun == null) {
            return false
        }

        return hookFun.exception?.path == ctor.exception?.path
    }

    private fun getAllFieldTypes(limeType: LimeType) = getAllFieldTypesRec(getLeafType(limeType), mutableSetOf())

    private fun getAllFieldTypesRec(
        leafType: LimeType,
        visitedTypes: MutableSet<LimeType>,
    ): List<LimeType> {
        if (leafType !is LimeStruct) return listOf(leafType)

        visitedTypes += leafType
        val typesToVisit = leafType.fields.map { getLeafType(it.typeRef.type.actualType) }.distinct() - visitedTypes
        return typesToVisit.flatMap { getAllFieldTypesRec(it, visitedTypes) } + leafType
    }

    private fun getLeafType(limeType: LimeType): LimeType =
        when (limeType) {
            is LimeTypeAlias -> getLeafType(limeType.typeRef.type)
            is LimeList -> getLeafType(limeType.elementType.type)
            is LimeSet -> getLeafType(limeType.elementType.type)
            is LimeMap -> getLeafType(limeType.valueType.type)
            else -> limeType
        }
}

/**
 * Phase 23.6-A: is this the LIME `@Dart(Default)` primary constructor? This is a robust,
 * non-name-based selection signal (unlike the reverted param-name heuristic that regressed
 * search). Guard A skips `@Deprecated` ctors and guard B skips ctors with a `Map` parameter —
 * neither is ever the React-Native-usable primary (e.g. `MapMeasureDependentRenderSize`'s
 * unsupported `Map` ctor used by route polylines, or the deprecated `ManeuverNotificationOptions`
 * ctor). Named ctors carry `@Dart("name")` (value type NAME), never `@Dart(Default)`.
 */
internal fun isPreferredPrimaryCtor(function: LimeFunction): Boolean =
    function.attributes.have(LimeAttributeType.DART, LimeAttributeValueType.DEFAULT) &&
        !function.attributes.have(LimeAttributeType.DEPRECATED) &&
        function.parameters.none { it.typeRef.type.actualType is LimeMap }

/**
 * Orders constructors so the `@Dart(Default)` primary (if any, and un-guarded) comes first, then by
 * ascending parameter count (the pre-existing behaviour when no eligible primary exists). EVERY
 * constructor-selection site must use this: all ctors resolve to the single name `make`, so the
 * name-dedup keeps only the first — divergent ordering silently corrupts `make()` arity.
 */
internal fun List<LimeFunction>.orderedByPrimaryThenArity(): List<LimeFunction> =
    sortedWith(compareByDescending<LimeFunction> { isPreferredPrimaryCtor(it) }.thenBy { it.parameters.size })

/** Same ordering for field constructors (by `asFunction()` primary-ness, then field count). */
internal fun List<LimeFieldConstructor>.orderedFieldCtorsByPrimaryThenArity(): List<LimeFieldConstructor> =
    sortedWith(
        compareByDescending<LimeFieldConstructor> { isPreferredPrimaryCtor(it.asFunction()) }
            .thenBy { it.fields.size },
    )

/**
 * Phase 23.11: the fields a lossless all-fields serializer (`makeFull`) must marshal, or null when
 * `makeFull` is unnecessary or unsafe. Structural, no name heuristics. Emitted only when:
 *  - the struct has ≥2 fields and at least one exposed (non-excluded) constructor, AND
 *  - the selected primary ctor (same `orderedByPrimaryThenArity` the wrapper/spec pick) does NOT
 *    cover every field, AND
 *  - every uncovered field is NULLABLE — so `makeFull` marshals the extras as `?? null` and can
 *    never dereference an unset non-nullable field (the wrapper stores uncovered fields as optionals).
 * This targets e.g. Location (widest ctor omits nullable pitch/laneIndex) while leaving structs with
 * uncovered non-nullable fields on their existing make(). No-constructor structs use synthetic make().
 */
internal fun makeFullFields(
    struct: LimeStruct,
    isExcluded: (LimeFunction) -> Boolean,
): List<LimeField>? {
    if (struct.fields.isEmpty()) return null
    val exposedCtors = (struct.constructors + struct.fieldConstructors.map { it.asFunction() }).filterNot(isExcluded)
    val primaryCtor = exposedCtors.orderedByPrimaryThenArity().firstOrNull()
    // No exposed constructor: the only alternative is the synthetic `make()`, whose params are the
    // struct's UNINITIALIZED fields — so it silently DROPS every defaulted (initialized) field. When
    // any field is defaulted, that make() is lossy (an all-defaulted struct serializes as an empty
    // native handle — the lossless-serialization gap, PLAN 27.14), so emit `makeFull` over every
    // field. The wrapper stores every field on the instance, so marshalling all of them is safe. If
    // no field is defaulted, the synthetic make() already carries every field and makeFull is moot.
    if (primaryCtor == null) return if (struct.initializedFields.isNotEmpty()) struct.fields else null
    // Exposed constructor present: only emit `makeFull` when the primary ctor omits fields (e.g.
    // Location omits nullable pitch/laneIndex) and every omitted field is nullable, so `makeFull`
    // never dereferences an unset non-nullable field.
    if (struct.fields.size < 2) return null
    val covered = primaryCtor.parameters.map { it.path.name }.toSet()
    val uncovered = struct.fields.filter { it.path.name !in covered }
    if (uncovered.isEmpty()) return null
    if (uncovered.any { !it.typeRef.isNullable }) return null
    return struct.fields
}

/**
 * Phase 23.5: is this interface a callback LISTENER (all its methods are void, ≤3 params, non-static,
 * and it has no properties/constants)? Such interfaces are implemented in JS as an object of callbacks
 * (one function property per method) and marshalled to the SDK via a multi-slot `create_proxy`.
 * Non-listener (object) interfaces — those with properties, constants, non-void methods, or high-arity
 * methods — stay opaque handles. Single-method listeners keep the existing jsi::Function shortcut, so
 * this is only consulted for the multi-method case.
 */
internal fun LimeInterface.isCallbackListenerInterface(): Boolean {
    val allFunctions = (functions + inheritedFunctions).filter { !it.isStatic }
    return allFunctions.isNotEmpty() &&
        allFunctions.all { it.returnType.isVoid && it.parameters.size <= 3 } &&
        properties.isEmpty() && inheritedProperties.isEmpty() && constants.isEmpty()
}
