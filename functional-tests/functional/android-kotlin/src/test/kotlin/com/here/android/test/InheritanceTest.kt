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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

internal class TestParentListener : ParentListener {
    var called: Boolean = false

    override fun listen() {
        called = true
    }
}

internal open class TestChildListener : ChildListener {
    var called: Boolean = false

    override fun listen() {
        called = true
    }
}

internal class TestGrandChildListener : TestChildListener()

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class InheritanceTest {
    private fun checkInheritance(parent: java.lang.Class<*>, child: java.lang.Class<*>): Boolean {
        return parent.isAssignableFrom(child)
    }

    @org.junit.Test
    fun createChildClassInstance() {
        val instance: ChildClass = ChildClass.createChildClass()

        assertEquals("Johnny", instance.getName())
        assertEquals(7, instance.luckyNumber)
    }

    @org.junit.Test
    fun castChildClassInstanceToParent() {
        val instance: ParentInterface = ChildClass.createChildClass().castToParent()

        assertEquals("Johnny", instance.getName())
        assertEquals(7, instance.luckyNumber)
    }

    @org.junit.Test
    fun createGrandchildClassInstance() {
        val instance: GrandchildClass = GrandchildClass.createGrandchildClass()

        assertEquals("John F. Kimberly", instance.getName())
        assertEquals(42, instance.luckyNumber)
    }

    @org.junit.Test
    fun castGrandchildClassInstanceToParent() {
        val instance: ParentInterface = GrandchildClass.createGrandchildClass().castToParent()

        assertEquals("John F. Kimberly", instance.getName())
        assertEquals(42, instance.luckyNumber)
    }

    @org.junit.Test
    fun talkToParents() {
        val parentListener: TestParentListener = TestParentListener()
        val childListener: TestChildListener = TestChildListener()
        val grandChildListener: TestGrandChildListener = TestGrandChildListener()

        val parentListeners = listOf(parentListener, childListener, grandChildListener)

        Teacher.talkToParents(parentListeners)

        assertTrue(parentListener.called)
        assertTrue(childListener.called)
        assertTrue(grandChildListener.called)
    }

    @org.junit.Test
    fun checkInheritanceRelationships() {
        assertTrue(checkInheritance(RootInterface::class.java, ChildInterface::class.java))
        assertTrue(checkInheritance(RootInterface::class.java, AnotherChildInterface::class.java))
        assertTrue(checkInheritance(ChildInterface::class.java, ConcreteChild::class.java))
        assertTrue(checkInheritance(AnotherChildInterface::class.java, AnotherConcreteChild::class.java))
        assertTrue(checkInheritance(ConcreteChild::class.java, ConcreteGrandChild::class.java))
        assertTrue(checkInheritance(AnotherConcreteChild::class.java, AnotherConcreteGrandChild::class.java))

        assertFalse(checkInheritance(ChildInterface::class.java, AnotherChildInterface::class.java))
        assertFalse(checkInheritance(AnotherChildInterface::class.java, ChildInterface::class.java))
        assertFalse(checkInheritance(ChildInterface::class.java, AnotherConcreteGrandChild::class.java))
        assertFalse(checkInheritance(AnotherChildInterface::class.java, ConcreteGrandChild::class.java))
    }

    @org.junit.Test
    fun testChildAsParentReturnsSameType() {
        val child: ChildClass = ChildClass.createChildClass()
        val parent: ParentInterface = child.castToParent()

        assertTrue(parent is ChildClass)
    }

    @org.junit.Test
    fun testCreateChildAsParentSameType() {
        val rootInterface: RootInterface = InheritanceTestHelper.createChildAsRootInterface()
        assertTrue(rootInterface is ChildInterface)
    }

    @org.junit.Test
    fun testCreateConcreteChildAsChildInterfaceSameType() {
        val childInterface: ChildInterface = InheritanceTestHelper.createConcreteChildAsChildInterface()
        assertTrue(childInterface is ConcreteChild)
    }

    @org.junit.Test
    fun testCreateGrandchildAsChildSameType() {
        val child: ConcreteChild = InheritanceTestHelper.createGrandchildClassAsChildClass()
        assertTrue(child is ConcreteGrandChild)

        val grandchild: ConcreteGrandChild = child as ConcreteGrandChild
        grandchild.text = "jump"
        assertEquals("jump", grandchild.text)
    }

    @org.junit.Test
    fun testCreateConjoinedChildrenAsChildInterface() {
        val childInterface: ChildInterface = InheritanceTestHelper.createConjoinedChildrenAsChildInterface()

        assertTrue(childInterface is ConcreteChild)
        assertFalse(childInterface is AnotherConcreteChild)
    }

    @org.junit.Test
    fun testCreateConjoinedChildrenAsAnotherChildInterface() {
        val childInterface: AnotherChildInterface =
            InheritanceTestHelper.createConjoinedChildrenAsAnotherChildInterface()

        assertTrue(childInterface is AnotherConcreteChild)
        assertFalse(childInterface is ConcreteChild)
    }

    @org.junit.Test
    fun testCreateDisjoinedChildrenAsParentInterface() {
        val childInterface: ParentInterface =
            InheritanceTestHelper.createDisjoinedChildrenAsParentInterface()

        assertTrue(childInterface is ChildClass)
    }

    @org.junit.Test
    fun testCreateDisjoinedChildrenAsRootInterface() {
        val childInterface: RootInterface = InheritanceTestHelper.createDisjoinedChildrenAsRootInterface()

        assertTrue(childInterface is ConcreteChild)
    }

    @org.junit.Test
    fun testFamilyListOfSubtypes() {
        val family: List<RootInterface> = InheritanceTestHelper.createFamilyList()

        assertEquals(6, family.size)
        assertTrue(family[0] is ChildInterface)
        assertTrue(family[1] is ConcreteChild)
        assertTrue(family[2] is AnotherChildInterface)
        assertTrue(family[3] is AnotherConcreteChild)
        assertTrue(family[4] is ConcreteGrandChild)
        assertTrue(family[5] is AnotherConcreteGrandChild)
    }
}