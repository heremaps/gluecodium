/*

 *
 */

@file:JvmName("AttributesClassExtensions")

package com.example.smoke

import com.example.NativeBase

@OnClass
class AttributesClass : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    @OnFunctionInClass

    external fun veryFun(@OnParameterInClass param: String) : Unit

    @OnPropertyInClass
    var prop: String
        external get
        external set




    companion object {
        @OnConstInClass
        @JvmField final val PI: Boolean = false
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

