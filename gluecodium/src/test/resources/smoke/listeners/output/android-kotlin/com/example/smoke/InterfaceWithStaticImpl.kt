/*

 *
 */

@file:JvmName("InterfaceWithStaticImpl")

package com.example.smoke

import com.example.NativeBase

class InterfaceWithStaticImpl : NativeBase, InterfaceWithStatic {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun regularFunction() : String

    override var regularProperty: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun staticFunction() : String
        @JvmStatic var staticProperty: String
            external get
            external set

    }
}
