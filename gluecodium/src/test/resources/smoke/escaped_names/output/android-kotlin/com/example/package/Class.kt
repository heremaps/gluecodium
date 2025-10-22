/*

 *
 */

@file:JvmName("classExtensions")

package com.example.package

import com.example.NativeBase

class Class : NativeBase, Interface {




    constructor() : this(Constructor(), null as Any?) {
        cacheThisInstance();
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()



    @Throws(Types.ExceptionException::class)
    external fun Fun(double: MutableList<Types.Struct>) : Types.Struct

    var Property: Types.Enum
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic external fun Constructor() : Long
    }
}

