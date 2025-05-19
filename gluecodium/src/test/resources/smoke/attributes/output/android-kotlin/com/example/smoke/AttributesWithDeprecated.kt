/*

 *
 */

@file:JvmName("AttributesWithDeprecated")

package com.example.smoke

import com.example.NativeBase

@Deprecated("")
@OnClass
class AttributesWithDeprecated : NativeBase {

    class SomeStruct {
        @Deprecated("")
        @OnField
        @JvmField var field: String



        constructor() {
            this.field = ""
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



    /**
     *
     */
    @Deprecated("")
    @OnFunctionInClass

    external fun veryFun() : Unit

    @Deprecated("")
    @OnPropertyInClass
    var prop: String
        external get
        external set




    companion object {
        @Deprecated("")
        @OnConstInClass
        @JvmField final val PI: Boolean = false
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

