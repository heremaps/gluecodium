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

package com.here.gluecodium.generator.reactnative

import com.here.gluecodium.generator.common.GeneratorOptions
import com.here.gluecodium.model.lime.LimeBasicType.TypeId
import com.here.gluecodium.model.lime.LimeBasicTypeRef
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeModel
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimePath
import com.here.gluecodium.model.lime.LimeStruct
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Golden test for Phase 27.27 (spec task 23): a `Duration` struct FIELD getter must apply the same
 * microseconds→seconds conversion (`/ 1000000.0`) the generator already applies to `Duration`
 * METHOD returns.
 *
 * Root cause (confirmed in generated C++): the method-return path
 * (`FfiMethodBodyBuilder.emitReturnToJsi`) divides a `Duration` result by `1000000.0`
 * (e.g. `NativeRouteModule::getDuration` → `static_cast<double>(__ffiResult) / 1000000.0`), but the
 * struct field-getter path (`ReactNativeGenerator.buildFieldGetterBody`) fell through to the generic
 * integer branch and emitted `static_cast<double>(__val)` with NO division — so
 * `SectionProgress.remainingDuration` crossed the JSI boundary in microseconds, inflating the live
 * navigation ETA ~1e6×.
 *
 * This fixture is product-neutral (`Segment` with `duration: Duration` and `pause: Duration?`) — it
 * proves the behaviour is not HERE-specific and covers BOTH the non-nullable and nullable field
 * getter paths. The unit-scaled field getter (`Duration`) must divide by 1e6; a plain `UInt64`
 * "count" field getter must NOT (guard against over-broad scaling).
 *
 * Validates: Requirements 12.1, 12.2 (design §12 Duration struct-field-getter µs→s conversion).
 */
class ReactNativeDurationFieldGetterTest {
    private val rootNamespace = listOf("gluecodium", "model")

    private val reactNativeGenerator =
        ReactNativeGenerator().apply {
            initialize(
                GeneratorOptions(
                    cppRootNamespace = rootNamespace,
                    libraryName = "library",
                ),
            )
        }

    /**
     * `Segment` — a struct (the `SectionProgress` shape) with a non-nullable `Duration` field
     * (`duration`), a nullable `Duration` field (`pause`), and a non-nullable `UInt64` "count" field
     * (`stepCount`) that must NOT be scaled.
     */
    private fun createSegmentStruct(): LimeStruct {
        val duration =
            LimeField(
                LimePath(rootNamespace, listOf("Segment", "duration")),
                typeRef = LimeBasicTypeRef(TypeId.DURATION),
            )
        val pause =
            LimeField(
                LimePath(rootNamespace, listOf("Segment", "pause")),
                typeRef = LimeBasicTypeRef(TypeId.DURATION, isNullable = true),
            )
        val stepCount =
            LimeField(
                LimePath(rootNamespace, listOf("Segment", "stepCount")),
                typeRef = LimeBasicTypeRef(TypeId.UINT64),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Segment")),
            fields = listOf(duration, pause, stepCount),
        )
    }

    private fun bridgeImpl(
        moduleFileName: String,
        vararg elements: LimeNamedElement,
    ): String {
        val files =
            reactNativeGenerator.generate(LimeModel(referenceMap = emptyMap(), topElements = elements.toList()))
        val impl = files.find { it.targetFile.name == moduleFileName }
        assertTrue("C++ bridge impl ($moduleFileName) should be generated", impl != null)
        return impl!!.content
    }

    @Test
    fun `non-nullable Duration field getter divides by 1e6 microseconds to seconds`() {
        val impl = bridgeImpl("NativeSegmentModule.cpp", createSegmentStruct())
        assertTrue(
            "the non-nullable Duration field getter must convert microseconds to seconds, matching the " +
                "Duration method-return path (static_cast<double>(__val) / 1000000.0). Body:\n$impl",
            impl.contains("static_cast<double>(__val) / 1000000.0"),
        )
    }

    @Test
    fun `nullable Duration field getter divides by 1e6 microseconds to seconds`() {
        val impl = bridgeImpl("NativeSegmentModule.cpp", createSegmentStruct())
        assertTrue(
            "the nullable Duration field getter must also convert microseconds to seconds after the " +
                "ULong nullable unbox. Body:\n$impl",
            impl.contains("static_cast<double>(__val) / 1000000.0"),
        )
    }

    @Test
    fun `plain UInt64 count field getter is NOT scaled`() {
        val impl = bridgeImpl("NativeSegmentModule.cpp", createSegmentStruct())
        // `stepCount` is a plain UInt64 count → returned as-is, never divided. A regression that
        // scaled every integer field would break unit-less counts.
        assertTrue(
            "a plain UInt64 count field getter must return the raw value without any division. Body:\n$impl",
            impl.contains("return static_cast<double>(__val);"),
        )
    }
}
