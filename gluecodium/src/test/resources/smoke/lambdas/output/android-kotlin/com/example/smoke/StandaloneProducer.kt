/*

 *
 */

@file:JvmName("StandaloneProducerExtensions")


package com.example.smoke

import com.example.NativeBase

fun interface StandaloneProducer {


    fun apply() : String
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class StandaloneProducerImpl : NativeBase, StandaloneProducer {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun apply() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
