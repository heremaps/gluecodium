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
import org.junit.runner.RunWith
import org.junit.Assert.assertEquals
import org.robolectric.ParameterizedRobolectricTestRunner
import org.robolectric.ParameterizedRobolectricTestRunner.Parameters
import org.robolectric.annotation.Config

internal open class ChildInterfaceKotlinImpl : ChildInterface {
    protected var myData: String = ""

    override fun getData(): String = myData

    override fun rootMethod(data: String) {
        myData = "Kotlin Child data is '$data'"
    }
}

internal class GrandChildInterfaceKotlinImpl : ChildInterfaceKotlinImpl() {
    override fun rootMethod(data: String) {
        myData = "Kotlin GrandChild data is '$data'"
    }
}

internal class AnotherChildInterfaceKotlinImpl : AnotherChildInterface {
    protected var myData: String = ""

    override fun getData(): String  = myData

    override fun rootMethod(data: String) {
        myData = "Kotlin AnotherChild data is '$data'"
    }
}

@RunWith(ParameterizedRobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class InheritanceOverridingMethodTest {

    enum class InstanceType {
        CHILD_INTERFACE_KOTLIN_IMPLEMENTATION,
        GRAND_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION,
        ANOTHER_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION,
        CHILD_INTERFACE_CPP_IMPLEMENTATION,
        ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION,
        CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
        ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
        CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION,
        ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION
    }

    private val data: String = "Custom data"
    private var instanceType: InstanceType
    private var expectedData: String

    constructor(instanceType: InstanceType, expectedData: String) {
        this.instanceType = instanceType
        this.expectedData = expectedData
    }

    // Instance creation has to be delayed until test run because we need to wait until the shared
    // library is loaded. that's why we reference instances in test parameters by just an enum entry
    // that will be used to create the native object using native factory methods. i.e:
    // InheritanceTestHelper.createChild()
    private fun createInstance(type: InheritanceOverridingMethodTest.InstanceType): RootInterface {
        return when (type) {
            InstanceType.CHILD_INTERFACE_KOTLIN_IMPLEMENTATION -> ChildInterfaceKotlinImpl()
            InstanceType.GRAND_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION -> GrandChildInterfaceKotlinImpl()
            InstanceType.ANOTHER_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION -> AnotherChildInterfaceKotlinImpl()
            InstanceType.CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createChild()
            InstanceType.ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createAnotherChild()
            InstanceType.CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createConcreteChild()
            InstanceType.ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createAnotherConcreteChild()
            InstanceType.CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createConcreteGrandChild()
            InstanceType.ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION -> InheritanceTestHelper.createAnotherConcreteGrandChild()
        }
    }

    private fun getData(instance: RootInterface): String? {
        return when (instance) {
            is ChildInterface -> instance.getData()
            is AnotherChildInterface -> instance.getData()
            else -> null
        }
    }

    @org.junit.Test
    fun checkOverriddenMethodCalledFromCpp() {
        val instance: RootInterface = createInstance(instanceType)

        InheritanceTestHelper.callRootMethod(instance, data)
        assertEquals(expectedData, getData(instance))
    }

    @org.junit.Test
    fun checkOverriddenMethodCalledFromKotlin() {
        val instance: RootInterface = createInstance(instanceType)

        instance.rootMethod(data)
        assertEquals(expectedData, getData(instance))
    }

    companion object {
        @JvmStatic
        @Parameters
        fun testData(): Collection<Array<Any>> {
            return listOf(
                arrayOf<Any>(InstanceType.CHILD_INTERFACE_KOTLIN_IMPLEMENTATION, "Kotlin Child data is 'Custom data'"),
                arrayOf<Any>(InstanceType.GRAND_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION, "Kotlin GrandChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.ANOTHER_CHILD_INTERFACE_KOTLIN_IMPLEMENTATION, "Kotlin AnotherChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ Child data is 'Custom data'"),
                arrayOf<Any>(InstanceType.ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ AnotherChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ ConcreteChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ AnotherConcreteChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ ConcreteGrandChild data is 'Custom data'"),
                arrayOf<Any>(InstanceType.ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ AnotherConcreteGrandChild data is 'Custom data'")
            )
        }
    }
}