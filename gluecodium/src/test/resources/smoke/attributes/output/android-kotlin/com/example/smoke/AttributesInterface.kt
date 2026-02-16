/*

 *
 */

@file:JvmName("AttributesInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

@OnInterface
interface AttributesInterface {


    @OnFunctionInInterface

    fun veryFun(@OnParameterInInterface param: String) : Unit

    @OnPropertyInInterface
    var prop: String
        get
        set


    companion object {
        @OnConstInInterface
        @JvmField final val PI: Boolean = false
    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class AttributesInterfaceImpl : NativeBase, AttributesInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    @OnFunctionInInterface

    override external fun veryFun(@OnParameterInInterface param: String) : Unit

    @OnPropertyInInterface
    override var prop: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
