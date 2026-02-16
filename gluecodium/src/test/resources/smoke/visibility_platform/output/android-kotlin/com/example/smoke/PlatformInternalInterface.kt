/*

 *
 */

@file:JvmName("PlatformInternalInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

internal interface PlatformInternalInterface {



}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class PlatformInternalInterfaceImpl : NativeBase, PlatformInternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
