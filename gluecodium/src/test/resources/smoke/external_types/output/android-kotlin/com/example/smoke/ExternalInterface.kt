/*

 *
 */

@file:JvmName("ExternalInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

interface ExternalInterface {
    enum class SomeEnum(@JvmField val value: Int) {
        SOME_VALUE(0);
    }
    class SomeStruct {
        @JvmField var someField: String



        constructor(someField: String) {
            this.someField = someField
        }





    }




    fun someMethod(someParameter: Byte) : Unit

    val someProperty: String
        get


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ExternalInterfaceImpl : NativeBase, ExternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun someMethod(someParameter: Byte) : Unit

    override val someProperty: String
        external get



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
