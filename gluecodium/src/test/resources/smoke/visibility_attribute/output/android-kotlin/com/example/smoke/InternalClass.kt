/*

 *
 */

@file:JvmName("InternalClassExtensions")


package com.example.smoke

import com.example.NativeBase

internal class InternalClass : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    @JvmSynthetic @JvmName("fooBar") internal external fun fooBar() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

