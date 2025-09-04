/*

 *
 */

@file:JvmName("LambdasInterface")

package com.example.smoke

import com.example.NativeBase

fun interface LambdasInterface {
    fun interface TakeScreenshotCallback {


        fun apply(p0: ByteArray?) : Unit
    }

    /**
     * @suppress
     */
    class TakeScreenshotCallbackImpl : NativeBase, TakeScreenshotCallback {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: ByteArray?) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }



    fun takeScreenshot(callback: LambdasInterface.TakeScreenshotCallback) : Unit


}

