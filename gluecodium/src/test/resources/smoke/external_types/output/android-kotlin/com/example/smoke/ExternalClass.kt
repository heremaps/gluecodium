/*

 *
 */

@file:JvmName("ExternalClass")

package com.example.smoke

import com.example.NativeBase

class ExternalClass : NativeBase {

    enum class SomeEnum(@JvmField val value: Int) {
        SOME_VALUE(0);
    }
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





    external fun someMethod(someParameter: Byte) : Unit

    val someProperty: String
        external get




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

