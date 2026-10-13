/*

 *
 */

@file:JvmName("SimpleClassExtensions")

package com.example.smoke

import com.example.NativeBase

interface SimpleClass {

    fun getStringValue() : String

    fun useSimpleClass(input: SimpleClass) : SimpleClass

    val title: String
        get

    companion object {

        @JvmStatic fun defaultTitle() : String {
            return SimpleClassImpl.defaultTitle()
        }

    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class SimpleClassImpl : NativeBase, SimpleClass {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun getStringValue() : String

    override external fun useSimpleClass(input: SimpleClass) : SimpleClass

    override val title: String
        external get

    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic external fun defaultTitle() : String
    }
}
