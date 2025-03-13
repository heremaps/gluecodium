/*

 *
 */

package com.example.smoke

import com.example.NativeBase

internal class InternalClassInherits : NativeBase, InternalInterfaceParent {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    override external fun fooBar() : Unit
    override var prop: String
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
