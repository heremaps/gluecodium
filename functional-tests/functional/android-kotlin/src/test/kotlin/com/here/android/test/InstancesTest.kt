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
class InstancesTest {
    @org.junit.Test
    fun setSameTypeInstances() {
        val instanceOne: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        val instanceTwo: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        val nestedInstanceOne: NestedInstantiableOne = InstancesFactory.createNestedInstantiableOne()
        instanceOne.setStringValue(INSTANCE_ONE_STRING)
        instanceTwo.setStringValue(INSTANCE_TWO_STRING)

        nestedInstanceOne.setSameTypeInstances(instanceOne, instanceTwo)

        val resultOne: SimpleInstantiableOne = nestedInstanceOne.getInstanceOne()
        val resultTwo: SimpleInstantiableOne = nestedInstanceOne.getInstanceTwo()
        assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue())
        assertEquals(INSTANCE_TWO_STRING, resultTwo.getStringValue())
    }

    @org.junit.Test
    fun setSameTypeInstances_identicalInstances() {
        val instanceOne: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        val nestedInstanceOne: NestedInstantiableOne = InstancesFactory.createNestedInstantiableOne()
        instanceOne.setStringValue(INSTANCE_ONE_STRING)

        nestedInstanceOne.setSameTypeInstances(instanceOne, instanceOne)

        val resultOne: SimpleInstantiableOne = nestedInstanceOne.getInstanceOne()
        val resultTwo: SimpleInstantiableOne = nestedInstanceOne.getInstanceTwo()
        assertEquals(INSTANCE_ONE_STRING, resultOne.getStringValue())
        assertEquals(INSTANCE_ONE_STRING, resultTwo.getStringValue())
    }

    @org.junit.Test
    fun setMultipleTypeInstances() {
        val simpleInstanceOne: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        val otherInstanceOne: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        val simpleInstanceTwo: SimpleInstantiableTwo = InstancesFactory.createSimpleInstantiableTwo()
        val nested: NestedInstantiableOne = InstancesFactory.createNestedInstantiableOne()
        val nestedInstantiableTwo: NestedInstantiableTwo = InstancesFactory.createNestedInstantiableTwo()
        simpleInstanceOne.setStringValue(INSTANCE_ONE_STRING)
        simpleInstanceTwo.setStringValue(INSTANCE_TWO_STRING)
        otherInstanceOne.setStringValue(INSTANCE_OTHER_STRING)
        nested.setSameTypeInstances(simpleInstanceOne, otherInstanceOne)

        nestedInstantiableTwo.setMultipleTypeInstances(simpleInstanceOne, simpleInstanceTwo, nested)

        assertEquals(INSTANCE_ONE_STRING, nestedInstantiableTwo.getInstantiableOne().getStringValue())
        assertEquals(INSTANCE_TWO_STRING, nestedInstantiableTwo.getInstantiableTwo().getStringValue())
        val nestedInstantiable: NestedInstantiableOne = nestedInstantiableTwo.getNestedInstantiable()
        assertEquals(INSTANCE_ONE_STRING, nestedInstantiable.getInstanceOne().getStringValue())
        assertEquals(INSTANCE_OTHER_STRING, nestedInstantiable.getInstanceTwo().getStringValue())
    }

    @org.junit.Test
    fun setSelfInstantiable() {
        val simpleOne: SimpleInstantiableOne = InstancesFactory.createSimpleInstantiableOne()
        simpleOne.setStringValue(INSTANCE_ONE_STRING)

        val simpleTwo: SimpleInstantiableTwo = InstancesFactory.createSimpleInstantiableTwo()
        simpleTwo.setStringValue(INSTANCE_TWO_STRING)

        val nestedOne: NestedInstantiableOne = InstancesFactory.createNestedInstantiableOne()
        val nestedTwo: NestedInstantiableTwo = InstancesFactory.createNestedInstantiableTwo()
        nestedTwo.setMultipleTypeInstances(simpleOne, simpleTwo, nestedOne)
        nestedTwo.setSelfInstantiable(nestedTwo)

        val selfInstantiable: NestedInstantiableTwo = nestedTwo.getSelfInstantiable()
        assertEquals(INSTANCE_ONE_STRING, selfInstantiable.getInstantiableOne().getStringValue())
        assertEquals(INSTANCE_TWO_STRING, selfInstantiable.getInstantiableTwo().getStringValue())
    }

    companion object {
        private const val INSTANCE_ONE_STRING: String = "simpleInstanceOne"
        private const val INSTANCE_TWO_STRING: String = "simpleInstanceTwo"
        private const val INSTANCE_OTHER_STRING: String = "simpleInstanceOther"
    }
}