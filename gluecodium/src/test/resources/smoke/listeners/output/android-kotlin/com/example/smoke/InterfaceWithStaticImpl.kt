/*

 *
 */

@file:JvmName("InterfaceWithStaticImplExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class InterfaceWithStaticImpl : NativeBase, InterfaceWithStatic {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun regularFunction() : String

    override var regularProperty: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun staticFunction() : String
        @JvmStatic var staticProperty: String
            external get
            external set

    }
}
