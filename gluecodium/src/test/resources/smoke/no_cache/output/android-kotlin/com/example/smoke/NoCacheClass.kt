/*

 *
 */

@file:JvmName("NoCacheClass")

package com.example.smoke

import com.example.NativeBase

class NoCacheClass : NativeBase {


    constructor() : this(make(), null as Any?) {
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun foo() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic external fun make() : Long
    }
}

