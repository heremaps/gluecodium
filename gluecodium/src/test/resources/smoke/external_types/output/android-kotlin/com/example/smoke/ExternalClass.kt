/*

 *
 */

@file:JvmName("ExternalClass")

package com.example.smoke

import com.example.NativeBase

class ExternalClass : NativeBase {

    enum class SomeEnum(private val value: Int) {
        SOME_VALUE(0);
    }
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



    external fun someMethod(someParameter: Byte) : Unit

    val someProperty: String
        external get




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
