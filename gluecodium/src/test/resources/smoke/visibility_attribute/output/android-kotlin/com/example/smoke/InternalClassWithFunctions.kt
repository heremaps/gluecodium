/*

 *
 */

@file:JvmName("InternalClassWithFunctions")

package com.example.smoke

import com.example.NativeBase

internal class InternalClassWithFunctions : NativeBase {



    constructor() : this(make(), null as Any?) {
        cacheThisInstance();
    }

    constructor(foo: String) : this(make(foo), null as Any?) {
        cacheThisInstance();
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()




    external fun fooBar() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic external fun make() : Long

        @JvmStatic external fun make(foo: String) : Long
    }
}
