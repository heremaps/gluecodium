/*

 *
 */

package com.example.smoke

import com.example.NativeBase
import com.example.dont.smoke.DontSmokeEnum

class SomeSkippedClass : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    external fun doFoo() : DontSmokeEnum



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
