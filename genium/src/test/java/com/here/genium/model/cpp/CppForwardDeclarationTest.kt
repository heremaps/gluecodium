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

package com.here.genium.model.cpp

import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class CppForwardDeclarationTest {

    @Test
    fun templateTypeWithGlobalModifier() {
        val forward = CppForwardDeclaration("::std::vector< Foo::Bar >")
        assertEquals(listOf("std"), forward.namespaces)
        assertEquals("vector< Foo::Bar >", forward.type)
    }

    @Test
    fun templateTypeWithoutGlobalModifier() {
        val forward = CppForwardDeclaration("std::vector< Foo::Bar >")
        assertEquals(listOf("std"), forward.namespaces)
        assertEquals("vector< Foo::Bar >", forward.type)
    }

    @Test
    fun nestedTemplateType() {
        val forward = CppForwardDeclaration("::std::vector< std::vector<Foo::Bar> >")
        assertEquals(listOf("std"), forward.namespaces)
        assertEquals("vector< std::vector<Foo::Bar> >", forward.type)
    }

    @Test
    fun simpleClassWithGlobalModifier() {
        val forward = CppForwardDeclaration("::Foo::Bar")
        assertEquals(listOf("Foo"), forward.namespaces)
        assertEquals("Bar", forward.type)
    }

    @Test
    fun simpleClassWithoutGlobalModifier() {
        val forward = CppForwardDeclaration("Foo::Bar")
        assertEquals(listOf("Foo"), forward.namespaces)
        assertEquals("Bar", forward.type)
    }

    @Test
    fun multipleNamespaces() {
        val forward = CppForwardDeclaration("::very::deeply::nested::namespace::Class")
        assertEquals(listOf("very", "deeply", "nested", "namespace"), forward.namespaces)
        assertEquals("Class", forward.type)
    }

    @Test
    fun noNamespaceWithGlobalModifier() {
        val forward = CppForwardDeclaration("::Bar")
        assertEquals(emptyList<String>(), forward.namespaces)
        assertEquals("Bar", forward.type)
    }

    @Test
    fun noNamespaceWithoutGlobalModifier() {
        val forward = CppForwardDeclaration("Bar")
        assertEquals(emptyList<String>(), forward.namespaces)
        assertEquals("Bar", forward.type)
    }

    @Test
    fun esotericNaming() {
        val forward = CppForwardDeclaration("\\u00C0::\\u00F8::\\u2C00\\u2C01")
        assertEquals(listOf("\\u00C0", "\\u00F8"), forward.namespaces)
        assertEquals("\\u2C00\\u2C01", forward.type)
    }
}
