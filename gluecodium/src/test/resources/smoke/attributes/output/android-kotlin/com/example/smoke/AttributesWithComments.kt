/*

 *
 */

@file:JvmName("AttributesWithComments")

package com.example.smoke

import com.example.NativeBase

/**
 * Class comment
 */
@OnClass
class AttributesWithComments : NativeBase {

    class SomeStruct {
        /**
         * Field comment
         */
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
     * Function comment
     */
    @OnFunctionInClass

    external fun veryFun() : Unit

    /**
     * Property comment
     */
    var prop: String
        external get
        external set




    companion object {
        /**
         * Const comment
         */
        @OnConstInClass
        @JvmField final val PI: Boolean = false
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

