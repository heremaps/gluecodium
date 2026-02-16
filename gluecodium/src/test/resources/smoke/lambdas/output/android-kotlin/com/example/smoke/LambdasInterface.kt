/*

 *
 */

@file:JvmName("LambdasInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

fun interface LambdasInterface {
    fun interface TakeScreenshotCallback {


        fun apply(p0: ByteArray?) : Unit
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class TakeScreenshotCallbackImpl : NativeBase, TakeScreenshotCallback {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: ByteArray?) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }



    fun takeScreenshot(callback: LambdasInterface.TakeScreenshotCallback) : Unit


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class LambdasInterfaceImpl : NativeBase, LambdasInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun takeScreenshot(callback: LambdasInterface.TakeScreenshotCallback) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
