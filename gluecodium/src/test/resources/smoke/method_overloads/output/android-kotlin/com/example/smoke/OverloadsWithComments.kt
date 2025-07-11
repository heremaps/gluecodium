/*

 *
 */

@file:JvmName("OverloadsWithComments")

package com.example.smoke

import com.example.NativeBase

class OverloadsWithComments : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun doStuff() : Unit
    /**
     * [com.example.smoke.OverloadsWithComments.doStuff.stuff]
     * @param stuff
     */

    external fun doStuff(stuff: String) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

