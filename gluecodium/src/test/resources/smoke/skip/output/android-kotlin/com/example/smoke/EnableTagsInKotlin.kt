/*

 *
 */

@file:JvmName("EnableTagsInKotlinExtensions")


package com.example.smoke

import com.example.NativeBase

interface EnableTagsInKotlin {



    fun enableTagged() : Unit


    fun enableTaggedList() : Unit


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class EnableTagsInKotlinImpl : NativeBase, EnableTagsInKotlin {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun enableTagged() : Unit


    override external fun enableTaggedList() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
