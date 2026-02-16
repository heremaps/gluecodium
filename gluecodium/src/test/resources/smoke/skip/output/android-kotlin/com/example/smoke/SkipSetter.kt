/*

 *
 */

@file:JvmName("SkipSetterExtensions")


package com.example.smoke

import com.example.NativeBase

interface SkipSetter {


    val foo: String
        get


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class SkipSetterImpl : NativeBase, SkipSetter {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override val foo: String
        external get



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
