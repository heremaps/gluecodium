/*

 *
 */

@file:JvmName("ParentClass")

package com.example.smoke

import com.example.NativeBase

open class ParentClass : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun rootMethod() : Unit

    var rootProperty: String
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

