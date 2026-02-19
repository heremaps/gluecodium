/*

 *
 */

@file:JvmName("InternalInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

internal fun interface InternalInterface {



    fun fooBar() : Unit


    companion object {


        @JvmStatic fun getSomePropertyOfInternalInterface() : String {
            return InternalInterfaceImpl.getSomePropertyOfInternalInterface()
        }



        @JvmStatic fun setSomePropertyOfInternalInterface(value: String) : Unit {
            InternalInterfaceImpl.setSomePropertyOfInternalInterface(value)
        }

    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class InternalInterfaceImpl : NativeBase, InternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun fooBar() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun getSomePropertyOfInternalInterface() : String

        @JvmStatic external fun setSomePropertyOfInternalInterface(value: String) : Unit
    }
}
