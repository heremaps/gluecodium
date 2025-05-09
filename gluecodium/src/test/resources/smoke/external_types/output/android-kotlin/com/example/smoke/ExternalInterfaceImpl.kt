/*

 *
 */

@file:JvmName("ExternalInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class ExternalInterfaceImpl : NativeBase, ExternalInterface {
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun someMethod(someParameter: Byte) : Unit

    override val someProperty: String
        external get



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
