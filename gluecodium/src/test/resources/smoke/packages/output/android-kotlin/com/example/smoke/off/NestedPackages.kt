/*

 *
 */

@file:JvmName("NestedPackagesExtensions")

package com.example.smoke.off

import com.example.NativeBase

class NestedPackages : NativeBase {

    class SomeStruct {
        @JvmField var someField: String



        constructor(someField: String) {
            this.someField = someField
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


        @JvmStatic external fun basicMethod(input: NestedPackages.SomeStruct) : NestedPackages.SomeStruct
    }
}

