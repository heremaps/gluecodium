/*

 *
 */

@file:JvmName("LambdasInterface")

package com.example.smoke

import com.example.NativeBase

interface LambdasInterface {
    fun interface TakeScreenshotCallback {
        fun apply(p0: ByteArray?) : Unit
    }

    class TakeScreenshotCallbackImpl : NativeBase, TakeScreenshotCallback {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: ByteArray?) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }

    fun takeScreenshot(callback: LambdasInterface.TakeScreenshotCallback) : Unit


}

