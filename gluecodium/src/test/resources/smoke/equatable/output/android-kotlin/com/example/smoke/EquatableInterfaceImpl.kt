/*

 *
 */

@file:JvmName("EquatableInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class EquatableInterfaceImpl : NativeBase, EquatableInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    override external fun equals(other: Any?) : Boolean
    override external fun hashCode(): Int

    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
