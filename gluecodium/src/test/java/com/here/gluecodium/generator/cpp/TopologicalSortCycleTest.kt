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

import com.here.gluecodium.cli.GluecodiumExecutionException
import com.here.gluecodium.model.cpp.CppComplexTypeRef
import com.here.gluecodium.model.cpp.CppField
import com.here.gluecodium.model.cpp.CppStruct
import com.here.gluecodium.model.cpp.CppUsing
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class TopologicalSortCycleTest {
    @JvmField
    @Rule
    val expectedException: ExpectedException = ExpectedException.none()

    @Before
    fun setUp() {
        expectedException.expect(GluecodiumExecutionException::class.java)
    }

    @Test
    fun cycleWithStructs() {
        val fooField = CppField("fooField", "fooField", type = CppComplexTypeRef("foo"))
        val barField = CppField("barField", "barField", type = CppComplexTypeRef("bar"))
        val fooStruct = CppStruct("foo", fields = listOf(barField))
        val barStruct = CppStruct("bar", fields = listOf(fooField))

        TopologicalSort(listOf(fooStruct, barStruct)).sort()
    }

    @Test
    fun cycleWithUsings() {
        val fooUsing = CppUsing("foo", "foo", definition = CppComplexTypeRef("bar"))
        val barUsing = CppUsing("bar", "bar", definition = CppComplexTypeRef("foo"))

        TopologicalSort(listOf(fooUsing, barUsing)).sort()
    }

    @Test
    fun cycleWithStructAndUsing() {
        val barField = CppField("barField", "barField", type = CppComplexTypeRef("bar"))
        val fooStruct = CppStruct("foo", fields = listOf(barField))
        val barUsing = CppUsing("bar", "bar", definition = CppComplexTypeRef("foo"))

        TopologicalSort(listOf(fooStruct, barUsing)).sort()
    }
}
