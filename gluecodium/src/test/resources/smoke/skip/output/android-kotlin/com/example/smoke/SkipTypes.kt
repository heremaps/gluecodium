/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class SkipTypes : NativeBase {

    class NotInJava(var fooField: String) {




    }


    class NotInSwift(var fooField: String) {




    }


    class NotInDart(var fooField: String) {




    }




    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
