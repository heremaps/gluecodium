/*

 *
 */

package com.example.smoke.off

import com.example.NativeBase

class NestedPackages : NativeBase {

    class SomeStruct {
        var someField: String



        constructor(someField: String) {
            this.someField = someField
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
        @JvmStatic external fun basicMethod(input: NestedPackages.SomeStruct) : NestedPackages.SomeStruct
    }
}
