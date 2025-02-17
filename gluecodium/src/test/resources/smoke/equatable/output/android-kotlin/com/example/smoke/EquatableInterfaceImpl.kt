/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class EquatableInterfaceImpl : NativeBase, EquatableInterface {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    override external fun equals(obj: Any?) : Boolean
    override external fun hashCode(): Int

    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
