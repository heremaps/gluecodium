/*

 *
 */

@file:JvmName("AttributesLambdaExtensions")


package com.example.smoke

import com.example.NativeBase

@OnLambda
fun interface AttributesLambda {


    fun apply() : Unit
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class AttributesLambdaImpl : NativeBase, AttributesLambda {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    @OnLambda

    override external fun apply() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
