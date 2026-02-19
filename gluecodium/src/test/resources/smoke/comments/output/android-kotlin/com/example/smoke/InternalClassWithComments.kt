/*

 *
 */

@file:JvmName("InternalClassWithCommentsExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This looks internal
 */
internal class InternalClassWithComments : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * This is definitely internal
     */

    @JvmSynthetic @JvmName("doNothing") internal external fun doNothing() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

