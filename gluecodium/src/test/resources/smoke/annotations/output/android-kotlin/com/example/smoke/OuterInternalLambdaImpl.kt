/*

 *
 */

@file:JvmName("OuterInternalLambdaImplExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

/**
 * @suppress
 */
@MySmokeTestsInternalApi
internal class OuterInternalLambdaImpl : NativeBase, OuterInternalLambda {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    @JvmSynthetic override external fun apply(p0: String) : Int



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
