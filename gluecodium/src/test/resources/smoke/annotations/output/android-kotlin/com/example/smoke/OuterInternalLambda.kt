/*

 *
 */

@file:JvmName("OuterInternalLambdaExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

@MySmokeTestsInternalApi
internal fun interface OuterInternalLambda {


    fun apply(p0: String) : Int
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class OuterInternalLambdaImpl : NativeBase, OuterInternalLambda {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun apply(p0: String) : Int



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
