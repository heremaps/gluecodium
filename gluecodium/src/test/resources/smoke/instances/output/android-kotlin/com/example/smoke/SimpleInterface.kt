/*

 *
 */

@file:JvmName("SimpleInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

interface SimpleInterface {



    fun getStringValue() : String


    fun useSimpleInterface(input: SimpleInterface) : SimpleInterface


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class SimpleInterfaceImpl : NativeBase, SimpleInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun getStringValue() : String


    override external fun useSimpleInterface(input: SimpleInterface) : SimpleInterface



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
