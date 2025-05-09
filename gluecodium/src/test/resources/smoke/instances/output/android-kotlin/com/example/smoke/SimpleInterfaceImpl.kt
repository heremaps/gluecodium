/*

 *
 */

@file:JvmName("SimpleInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class SimpleInterfaceImpl : NativeBase, SimpleInterface {
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun getStringValue() : String
    override external fun useSimpleInterface(input: SimpleInterface) : SimpleInterface



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
