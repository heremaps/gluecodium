/*

 *
 */

@file:JvmName("PlatformNamesListenerImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class dodoListenerImpl : NativeBase, dodoListener {
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun DodoMethod(DodoParameter: String) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
