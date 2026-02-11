/*

 *
 */

@file:JvmName("PropertiesInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

interface PropertiesInterface {
    class ExampleStruct {
        @JvmField var value: Double



        constructor(value: Double) {
            this.value = value
        }





    }



    var structProperty: PropertiesInterface.ExampleStruct
        get
        set


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class PropertiesInterfaceImpl : NativeBase, PropertiesInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override var structProperty: PropertiesInterface.ExampleStruct
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
