/*

 *
 */

@file:JvmName("InterfaceWithStaticExtensions")


package com.example.smoke

import com.example.NativeBase

interface InterfaceWithStatic {



    fun regularFunction() : String

    var regularProperty: String
        get
        set


    companion object {


        @JvmStatic fun staticFunction() : String {
            return InterfaceWithStaticImpl.staticFunction()
        }

        @JvmStatic fun getStaticProperty(): String {
            return InterfaceWithStaticImpl.staticProperty
        }

        @JvmStatic fun setStaticProperty(value: String) {
            InterfaceWithStaticImpl.staticProperty = value
        }
    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class InterfaceWithStaticImpl : NativeBase, InterfaceWithStatic {
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
