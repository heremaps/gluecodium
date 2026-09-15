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
 * Golden test (spec task 58): a `Duration` PARAMETER marshalled from JS INTO the FFI must multiply
 * by `1000000.0` (seconds → microseconds) — the setter-side mirror of the getter/return conversion
 * fixed in Phase 27.27 (task 23). Without it a JS `Duration` argument is stored 1e6× too small
 * (e.g. `LocationSimulatorOptions.notificationInterval = 500` (500 ms) became 500 µs, producing a
 * firehose of location updates whose position never advanced — the reported navigation bug).
 *
 * The generator emits a struct field constructor (`makeFull(...)`) whose specified fields route
 * through `FfiMethodBodyBuilder.marshalBasicParam`, so a struct with a `Duration` field exercises
 * the exact parameter-in path. This fixture is product-neutral (`Timing` with `interval: Duration`,
 * `pause: Duration?`, `startedAt: Date`, `count: UInt64`) and asserts:
 *  - non-nullable `Duration` param → `* 1000000.0` (seconds → microseconds),
 *  - nullable `Duration` param → also `* 1000000.0`,
 *  - `Date` param → NOT scaled (absolute epoch, matches the raw getter),
 *  - plain `UInt64` param → NOT scaled (guard against over-broad scaling).
 *
 * Validates: Requirements 7.3, 1.4, 12.1 (design — Duration parameter µs symmetry).
 */
class ReactNativeDurationParamTest {
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
     * `Timing` — a struct with a non-nullable `Duration` field (`interval`), a nullable `Duration`
     * field (`pause`), a `Date` field (`startedAt`, absolute epoch — unscaled), and a plain `UInt64`
     * count (`count`, unscaled). The generator emits a `makeFull` field constructor whose params run
     * through the parameter-marshalling path under test.
     */
    private fun createTimingStruct(): LimeStruct {
        val interval =
            LimeField(
                LimePath(rootNamespace, listOf("Timing", "interval")),
                typeRef = LimeBasicTypeRef(TypeId.DURATION),
            )
        val pause =
            LimeField(
                LimePath(rootNamespace, listOf("Timing", "pause")),
                typeRef = LimeBasicTypeRef(TypeId.DURATION, isNullable = true),
            )
        val startedAt =
            LimeField(
                LimePath(rootNamespace, listOf("Timing", "startedAt")),
                typeRef = LimeBasicTypeRef(TypeId.DATE),
            )
        val count =
            LimeField(
                LimePath(rootNamespace, listOf("Timing", "count")),
                typeRef = LimeBasicTypeRef(TypeId.UINT64),
            )
        return LimeStruct(
            LimePath(rootNamespace, listOf("Timing")),
            fields = listOf(interval, pause, startedAt, count),
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
    fun `non-nullable Duration param multiplies by 1e6 seconds to microseconds`() {
        val impl = bridgeImpl("NativeTimingModule.cpp", createTimingStruct())
        assertTrue(
            "a non-nullable Duration parameter must be multiplied by 1e6 on the way in (seconds → " +
                "microseconds), the mirror of the getter's ÷1e6. Body:\n$impl",
            impl.contains("* 1000000.0"),
        )
    }

    @Test
    fun `nullable Duration param multiplies by 1e6 seconds to microseconds`() {
        val impl = bridgeImpl("NativeTimingModule.cpp", createTimingStruct())
        assertTrue(
            "a nullable Duration parameter must also be multiplied by 1e6 after has_value(). Body:\n$impl",
            impl.contains(".value()) * 1000000.0"),
        )
    }

    @Test
    fun `Date param is NOT scaled`() {
        val impl = bridgeImpl("NativeTimingModule.cpp", createTimingStruct())
        // A Date is an absolute epoch value → passed through as static_cast<uint64_t>(name), never
        // multiplied. Assert no accidental scaling was introduced for Date.
        assertTrue(
            "a Date parameter must pass through unscaled (static_cast<uint64_t>(...)) with no *1e6. Body:\n$impl",
            impl.contains("static_cast<uint64_t>(startedAt)"),
        )
    }
}
