/*

 *
 */

@file:JvmName("PropertiesInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

class PropertiesInterfaceImpl : NativeBase, PropertiesInterface {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    override var structProperty: PropertiesInterface.ExampleStruct
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
