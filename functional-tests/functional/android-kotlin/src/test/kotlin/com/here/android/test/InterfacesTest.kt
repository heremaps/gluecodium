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
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class InterfacesTest {

    @org.junit.Test
    fun setSameTypeInterfaces() {
        val instanceOne: SimpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne()
        instanceOne.setStringValue(INSTANCE_ONE_STRING)

        val instanceTwo: SimpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne()
        instanceTwo.setStringValue(INSTANCE_TWO_STRING)

        val nestedInterfaceOne: NestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne()
        nestedInterfaceOne.setSameTypeInterfaces(instanceOne, instanceTwo)

        val resultOne: SimpleInterfaceOne = nestedInterfaceOne.getInterfaceOne()
        val resultTwo: SimpleInterfaceOne = nestedInterfaceOne.getInterfaceTwo()
        assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue())
        assertEquals(INSTANCE_TWO_STRING, resultTwo.getStringValue())
    }

    @org.junit.Test
    fun setSameTypeInterfaces_identicalInterface() {
        val instanceOne: SimpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne()
        instanceOne.setStringValue(INSTANCE_ONE_STRING)

        val nestedInterfaceOne: NestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne()
        nestedInterfaceOne.setSameTypeInterfaces(instanceOne, instanceOne)

        val resultOne: SimpleInterfaceOne = nestedInterfaceOne.getInterfaceOne()
        val resultTwo: SimpleInterfaceOne = nestedInterfaceOne.getInterfaceTwo()
        assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue())
        assertEquals(INSTANCE_ONE_STRING, resultTwo.getStringValue())
    }

    @org.junit.Test
    fun setMultipleTypeInterface() {
        val simpleInterfaceOne: SimpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne()
        val otherInterfaceOne: SimpleInterfaceOne = InterfacesFactory.createSimpleInterfaceOne()
        val simpleInterfaceTwo: SimpleInterfaceTwo = InterfacesFactory.createSimpleInterfaceTwo()
        val nested: NestedInterfaceOne = InterfacesFactory.createNestedInterfaceOne()
        val nestedInterfaceTwo: NestedInterfaceTwo = InterfacesFactory.createNestedInterfaceTwo()
        simpleInterfaceOne.setStringValue(INSTANCE_ONE_STRING)
        simpleInterfaceTwo.setStringValue(INSTANCE_TWO_STRING)
        otherInterfaceOne.setStringValue(INSTANCE_OTHER_STRING)
        nested.setSameTypeInterfaces(simpleInterfaceOne, otherInterfaceOne)

        nestedInterfaceTwo.setMultipleTypeInterfaces(simpleInterfaceOne, simpleInterfaceTwo, nested)

        assertEquals(INSTANCE_ONE_STRING, nestedInterfaceTwo.getInterfaceOne().getStringValue())
        assertEquals(INSTANCE_TWO_STRING, nestedInterfaceTwo.getInterfaceTwo().getStringValue())

        val nestedInterface: NestedInterfaceOne = nestedInterfaceTwo.getNestedInterface()
        assertEquals(INSTANCE_ONE_STRING, nestedInterface.getInterfaceOne().getStringValue())
        assertEquals(INSTANCE_OTHER_STRING, nestedInterface.getInterfaceTwo().getStringValue())
    }

    companion object {
        private val INSTANCE_ONE_STRING: String = "simpleInterfaceOne"
        private val INSTANCE_TWO_STRING: String = "simpleInterfaceTwo"
        private val INSTANCE_OTHER_STRING: String = "simpleInstanceOther"
    }
}