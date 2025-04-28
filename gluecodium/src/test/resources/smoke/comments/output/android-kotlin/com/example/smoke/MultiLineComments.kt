/*

 *
 */

@file:JvmName("MultiLineComments")

package com.example.smoke

import com.example.NativeBase

class MultiLineComments : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    external fun someMethodWithLongComment(input: String, ratio: Double) : Float




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
