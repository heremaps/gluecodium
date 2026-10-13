/*

 *
 */

@file:JvmName("ReadOnlyClassExtensions")


package com.example.smoke

import com.example.NativeBase

interface ReadOnlyClass {



    fun getStringValue() : String

    val title: String
        get


    companion object {


        @JvmStatic fun defaultTitle() : String {
            return ReadOnlyClassImpl.defaultTitle()
        }

    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ReadOnlyClassImpl : NativeBase, ReadOnlyClass {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun getStringValue() : String


    @JvmSynthetic @JvmName("updateValue") internal external fun updateValue(input: String) : Unit

    override val title: String
        external get


    internal val relevance: Int?
        @JvmSynthetic @JvmName("getRelevance") external get



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun defaultTitle() : String
    }
}
