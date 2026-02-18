/*

 *
 */

@file:JvmName("InternalClassWithStaticPropertyExtensions")


package com.example.smoke

import com.example.NativeBase

internal class InternalClassWithStaticProperty : NativeBase {



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


        @JvmStatic external fun getFooBar() : String

        @JvmStatic external fun setFooBar(value: String) : Unit
    }
}

