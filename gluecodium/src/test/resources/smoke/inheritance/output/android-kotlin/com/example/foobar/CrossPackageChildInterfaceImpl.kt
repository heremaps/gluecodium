/*

 *
 */

@file:JvmName("CrossPackageChildInterfaceImpl")

package com.example.foobar

import com.example.NativeBase

/**
 * @suppress
 */
class CrossPackageChildInterfaceImpl : NativeBase, CrossPackageChildInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    override external fun rootMethod() : Unit
    override var rootProperty: String
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
