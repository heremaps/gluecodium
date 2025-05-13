/*

 *
 */

@file:JvmName("PropertiesInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class PropertiesInterfaceImpl : NativeBase, PropertiesInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override var structProperty: PropertiesInterface.ExampleStruct
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
