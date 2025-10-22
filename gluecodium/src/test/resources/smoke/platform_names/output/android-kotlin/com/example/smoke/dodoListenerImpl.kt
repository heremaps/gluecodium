/*

 *
 */

@file:JvmName("PlatformNamesListenerImplExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class dodoListenerImpl : NativeBase, dodoListener {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun DodoMethod(DodoParameter: String) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
