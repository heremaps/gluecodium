/*

 *
 */

@file:JvmName("SkipTagsInKotlinExtensions")


package com.example.smoke

import com.example.NativeBase

fun interface SkipTagsInKotlin {



    fun dontSkipTagged() : Unit


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class SkipTagsInKotlinImpl : NativeBase, SkipTagsInKotlin {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun dontSkipTagged() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
