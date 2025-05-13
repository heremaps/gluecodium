/*

 *
 */

@file:JvmName("InternalListenerImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class InternalListenerImpl : NativeBase, InternalListener {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun onEvent() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
