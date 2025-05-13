/*

 *
 */

@file:JvmName("SkipFunctions")

package com.example.smoke

import com.example.NativeBase

class SkipFunctions : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun notInJava(input: String) : String


        @JvmStatic external fun notInSwift(input: Boolean) : Boolean


        @JvmStatic external fun notInDart(input: Float) : Float
    }
}

