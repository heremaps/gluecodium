/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class ExternalInterfaceImpl : NativeBase, ExternalInterface {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun someMethod(someParameter: Byte) : Unit

    override val someProperty: String
        external get



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
