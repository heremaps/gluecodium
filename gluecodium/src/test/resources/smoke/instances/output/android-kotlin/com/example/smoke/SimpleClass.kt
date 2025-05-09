/*

 *
 */

@file:JvmName("SimpleClass")

package com.example.smoke

import com.example.NativeBase

class SimpleClass : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun getStringValue() : String


    external fun useSimpleClass(input: SimpleClass) : SimpleClass




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
