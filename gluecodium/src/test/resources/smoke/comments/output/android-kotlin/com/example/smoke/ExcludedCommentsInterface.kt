/*

 *
 */

@file:JvmName("ExcludedCommentsInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is some very useful interface.
 * @suppress
 */
interface ExcludedCommentsInterface {



}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ExcludedCommentsInterfaceImpl : NativeBase, ExcludedCommentsInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
