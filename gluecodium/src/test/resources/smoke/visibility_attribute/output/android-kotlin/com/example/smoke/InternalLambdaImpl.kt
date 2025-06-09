/*

 *
 */

@file:JvmName("InternalLambdaImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
internal class InternalLambdaImpl : NativeBase, InternalLambda {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun apply() : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
