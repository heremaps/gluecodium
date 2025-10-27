/*

 *
 */

@file:JvmName("SpecialAttributesExtensions")

package com.example.smoke

import com.example.NativeBase

class SpecialAttributes : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    @Deprecated("foo\nbar")

    external fun withEscaping() : Unit

    @HackMerm -rf *

    external fun withLineBreak() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

