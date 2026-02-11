/*

 *
 */

@file:JvmName("FreeLambdaExtensions")


package com.example.smoke

import com.example.NativeBase
import java.util.Date

fun interface FreeLambda {


    fun apply(p0: Date) : FreeEnum
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class FreeLambdaImpl : NativeBase, FreeLambda {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun apply(p0: Date) : FreeEnum



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
