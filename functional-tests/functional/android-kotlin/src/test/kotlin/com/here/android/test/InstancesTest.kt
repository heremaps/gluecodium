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
import com.here.android.another.AdditionalErrors.ExternalErrorCode
import com.here.android.another.AdditionalErrors.ExternalException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class InstancesTest {
    private data class ConsumerInstance(override val title: String, val fail: Boolean = false) : ImplementableInstance {
        override fun describe() = "consumer description"

        override fun getMessage(): String {
            if (fail) throw ExternalException(ExternalErrorCode.FAILED)
            return "consumer message"
        }

        override fun echo(other: ImplementableInstance): ImplementableInstance = other
    }

    @org.junit.Test
    fun nativeImplementationUsesInterfaceContract() {
        val instance = InstancesFactory.createImplementableInstance()

        assertEquals("native", instance.title)
        assertEquals("native description", instance.describe())
        assertEquals("native:native description", InstancesFactory.readImplementableInstance(instance))
        assertEquals("default", ImplementableInstance.defaultTitle())
    }

    @org.junit.Test
    fun consumerImplementationIsCalledFromNativeCode() {
        val instance = ConsumerInstance("consumer")

        assertEquals("consumer:consumer description", InstancesFactory.readImplementableInstance(instance))
    }

    @org.junit.Test
    fun consumerImplementationRoundTripPreservesIdentity() {
        val instance = ConsumerInstance("consumer")
        val other = ConsumerInstance("other")

        assertSame(other, InstancesFactory.echoImplementableInstance(instance, other))
        assertSame(instance, InstancesFactory.echoImplementableInstance(instance, instance))
    }

    private class CountingCachedRefInstance(
        private val values: List<String> = listOf("consumer", "items"),
        private val text: String = "consumer label",
    ) : CachedRefInstance {
        var itemsReads = 0
        var labelReads = 0

        override val items: List<String>
            get() {
                itemsReads++
                return values
            }

        override val label: String
            get() {
                labelReads++
                return text
            }
    }

    @org.junit.Test
    fun nativeCachedRefInstanceUsesInterfaceContract() {
        val instance = InstancesFactory.createCachedRefInstance()

        assertEquals(listOf("native", "items"), instance.items)
        assertEquals("native label", instance.label)
        assertEquals("stable|native,items|native label", InstancesFactory.readCachedRefInstance(instance))
    }

    @org.junit.Test
    fun consumerCachedRefValuesAreConvertedOnceAndStayStable() {
        val instance = CountingCachedRefInstance()

        // Native code reads each property twice during one call; the consumer getter must run once.
        assertEquals("stable|consumer,items|consumer label", InstancesFactory.readCachedRefInstance(instance))
        assertEquals(1, instance.itemsReads)
        assertEquals(1, instance.labelReads)
    }

    @org.junit.Test
    fun consumerCachedRefValuesAreReadOnceFromNativeWorkerThread() {
        val instance = CountingCachedRefInstance()

        assertEquals("stable|consumer,items|consumer label", InstancesFactory.readCachedRefInstanceOnWorker(instance))
        assertEquals(1, instance.itemsReads)
        assertEquals(1, instance.labelReads)
    }

    @org.junit.Test
    fun nativeCachedRefReferenceStaysValidWhileNativeCodeRetainsTheInstance() {
        val instance = CountingCachedRefInstance(listOf("retained", "values"))
        InstancesFactory.retainCachedRefItems(instance)
        System.gc()

        assertEquals("same|retained,values", InstancesFactory.readRetainedCachedRefItems())
        assertEquals("same|retained,values", InstancesFactory.readRetainedCachedRefItems())
        assertEquals(1, instance.itemsReads)

        InstancesFactory.clearRetainedCachedRefItems()
        assertEquals("none", InstancesFactory.readRetainedCachedRefItems())
    }

    @org.junit.Test
    fun nativeWorkerCanInvokeConsumerImplementation() {
        val callerThread = Thread.currentThread().id
        var invokedThread = callerThread
        val instance = object : ImplementableInstance by ConsumerInstance("consumer") {
            override fun describe(): String {
                invokedThread = Thread.currentThread().id
                return "worker description"
            }
        }

        assertEquals("consumer:worker description", InstancesFactory.readImplementableInstanceOnWorker(instance))
        assertNotEquals(callerThread, invokedThread)
    }

    @org.junit.Test
    fun nativeRetentionPreservesConsumerUntilExplicitRelease() {
        val instance = ConsumerInstance("retained")
        try {
            InstancesFactory.retainImplementableInstance(instance)
            val retained = requireNotNull(InstancesFactory.getRetainedImplementableInstance())
            assertSame(instance, retained)
            assertEquals("retained:consumer description", InstancesFactory.readImplementableInstance(retained))
        } finally {
            InstancesFactory.clearRetainedImplementableInstance()
        }
        assertNull(InstancesFactory.getRetainedImplementableInstance())
    }

    @org.junit.Test
    fun declaredConsumerErrorRoundTripsThroughNativeCode() {
        assertEquals("consumer message", InstancesFactory.getImplementableMessage(ConsumerInstance("consumer")))
        val exception = assertThrows(ExternalException::class.java) {
            InstancesFactory.getImplementableMessage(ConsumerInstance("consumer", fail = true))
        }
        assertEquals(ExternalErrorCode.FAILED, exception.error)
    }

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