/*

 *
 */

@file:JvmName("InternalListenerImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
internal class InternalListenerImpl : NativeBase, InternalListener {
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun onEvent() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
