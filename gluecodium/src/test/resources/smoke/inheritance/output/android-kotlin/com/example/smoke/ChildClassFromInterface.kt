/*

 *
 */

@file:JvmName("ChildClassFromInterface")

package com.example.smoke

import com.example.NativeBase

class ChildClassFromInterface : NativeBase, ParentInterface {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun childClassMethod() : Unit




    override external fun rootMethod() : Unit
    override var rootProperty: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

