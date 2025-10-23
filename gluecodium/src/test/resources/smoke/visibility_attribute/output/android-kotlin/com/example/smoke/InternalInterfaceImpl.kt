/*

 *
 */

@file:JvmName("InternalInterfaceImplExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
internal class InternalInterfaceImpl : NativeBase, InternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun fooBar() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
