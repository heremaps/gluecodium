/*

 *
 */

@file:JvmName("GrandChildInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class GrandChildInterfaceImpl : NativeBase, GrandChildInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun grandChildMethod() : Unit




    override external fun childMethod() : Unit


    override external fun rootMethod() : Unit
    override var rootProperty: String
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
