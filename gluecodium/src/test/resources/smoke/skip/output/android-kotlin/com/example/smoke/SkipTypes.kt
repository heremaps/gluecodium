/*

 *
 */

@file:JvmName("SkipTypesExtensions")

package com.example.smoke

import com.example.NativeBase

class SkipTypes : NativeBase {

    class NotInJava {
        @JvmField var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }





    }

    class NotInSwift {
        @JvmField var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }





    }

    class NotInDart {
        @JvmField var fooField: String



        constructor(fooField: String) {
            this.fooField = fooField
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

