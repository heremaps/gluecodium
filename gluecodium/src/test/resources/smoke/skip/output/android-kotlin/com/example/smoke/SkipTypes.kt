/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class SkipTypes : NativeBase {

    class NotInJava {
        var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }




    }

    class NotInSwift {
        var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }




    }

    class NotInDart {
        var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }




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
