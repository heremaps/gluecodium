/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class SpecialNames : NativeBase {


    constructor(result: String) : this(make(result), null as Any?) {
        cacheThisInstance();
    }

    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()


    external fun create() : Unit
    external fun release() : Unit
    external fun createProxy() : Unit
    external fun Uppercase() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun make(result: String) : Long
    }
}
