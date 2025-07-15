/*

 *
 */

@file:JvmName("InternalPropertyOnly")

package com.example.smoke

import com.example.NativeBase

class InternalPropertyOnly : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    internal var foo: String
        @JvmName("getFoo") external get
        @JvmName("setFoo") external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

