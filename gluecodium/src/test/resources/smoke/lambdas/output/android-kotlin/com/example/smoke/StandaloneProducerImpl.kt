/*

 *
 */

@file:JvmName("StandaloneProducerImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class StandaloneProducerImpl : NativeBase, StandaloneProducer {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun apply() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
