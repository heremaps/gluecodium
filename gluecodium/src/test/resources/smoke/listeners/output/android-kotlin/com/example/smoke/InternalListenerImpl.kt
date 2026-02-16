/*

 *
 */

@file:JvmName("InternalListenerImplExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
internal class InternalListenerImpl : NativeBase, InternalListener {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
