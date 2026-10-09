/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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

package com.here.gluecodium.validator

import com.here.gluecodium.common.LimeLogger
import com.here.gluecodium.model.lime.LimeAttributeType.IMMUTABLE
import com.here.gluecodium.model.lime.LimeAttributeType.KOTLIN
import com.here.gluecodium.model.lime.LimeAttributeValueType.DATA_CLASS
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeStruct

/**
 * Validates every usage of `@Kotlin(DataClass)` in the model, regardless of the kind of element it is applied to.
 *
 * Rationale for restricting `@Kotlin(DataClass)` to `struct`: the C++/JNI code generator selects its
 * instance-construction strategy purely on the LimeIDL element type (`LimeStruct` vs. `LimeClass`), independent of
 * any Kotlin-specific attribute. `LimeStruct` instances are always constructed on the native->Kotlin path via
 * `alloc_object` plus direct field writes (no Kotlin constructor is ever invoked). `LimeClass` instances are always
 * constructed via `create_instance_object`, which looks up the NativeBase constructor with signature
 * `(long, Object)`.
 *
 * A Kotlin `data class` generated for a tagged struct has only the fields-based primary constructor and no
 * `(Long, Any?)` constructor. If `@Kotlin(DataClass)` was applied to a `class` (or any other non-`struct` element),
 * the generated C++ would still call `create_instance_object`, which would fail to find the `(long, Object)`
 * constructor at runtime and crash with `NoSuchMethodError` inside `JNI NewObjectV`. This is a deterministic runtime
 * crash, not a build-time error, so it must be caught here instead.
 *
 * Rationale for requiring `@Immutable`: a Kotlin `data class` only ever has `val` properties. Without `@Immutable`
 * on the LimeIDL struct, the C++, Swift and Dart representations of the same struct would remain mutable, which
 * would make the Kotlin representation inconsistent with the other generated platforms.
 *
 * Rationale for rejecting explicit/field constructors: the data-class primary constructor is always generated from
 * the struct's fields (see `KotlinStruct.mustache`), so any user-defined `constructor` or `field constructor` on a
 * `@Kotlin(DataClass)` struct is silently ignored for the Kotlin target. That would be surprising and error-prone,
 * so it is reported as a build-time error instead.
 */
internal class LimeKotlinDataClassValidator(private val logger: LimeLogger) {
    fun validate(limeModel: LimeModel): Boolean {
        val taggedElements =
            limeModel.referenceMap.values
                .filterIsInstance<LimeNamedElement>()
                .filter { it.attributes.have(KOTLIN, DATA_CLASS) }

        return taggedElements.map { validateElement(it) }.none { !it }
    }

    private fun validateElement(element: LimeNamedElement): Boolean {
        if (element !is LimeStruct) {
            logger.error(
                element,
                "@Kotlin(DataClass) is not supported on '${elementKind(element)}' elements, only on 'struct' " +
                    "elements. Applying it to a non-struct element generates a Kotlin data class with no " +
                    "NativeBase (Long, Any?) constructor, while the C++/JNI layer still uses the NativeBase " +
                    "'create_instance_object' construction path for non-struct elements; this fails with " +
                    "'NoSuchMethodError' / 'JNI NewObjectV' at runtime when native code constructs an instance. " +
                    "Convert this LimeIDL element to a 'struct' to use @Kotlin(DataClass).",
            )
            return false
        }

        var isValid = true

        if (!element.attributes.have(IMMUTABLE)) {
            logger.error(
                element,
                "@Kotlin(DataClass) requires the struct to also be marked '@Immutable'. A Kotlin data class only " +
                    "ever has 'val' properties, so the struct must be immutable to keep the generated Kotlin, " +
                    "C++, Swift and Dart representations consistent with each other.",
            )
            isValid = false
        }

        if (element.constructors.isNotEmpty() || element.fieldConstructors.isNotEmpty()) {
            logger.error(
                element,
                "structs marked with @Kotlin(DataClass) must not declare an explicit 'constructor' or " +
                    "'field constructor': the data class' primary constructor is always generated from the " +
                    "struct's fields, so any explicit constructor would silently be ignored for the Kotlin " +
                    "target. Remove the explicit constructor(s), or remove @Kotlin(DataClass) if a custom " +
                    "constructor is required.",
            )
            isValid = false
        }

        return isValid
    }

    private fun elementKind(element: LimeNamedElement) = element::class.simpleName?.removePrefix("Lime") ?: "unknown"
}
