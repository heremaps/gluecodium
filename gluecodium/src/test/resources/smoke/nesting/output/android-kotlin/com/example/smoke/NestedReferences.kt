/*

 *
 */

@file:JvmName("NestedReferences")

package com.example.smoke

import com.example.NativeBase

class NestedReferences : NativeBase {

    class NestedReferences {
        @JvmField var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
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





    external fun insideOut(struct1: NestedReferences.NestedReferences, struct2: NestedReferences.NestedReferences) : NestedReferences




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

