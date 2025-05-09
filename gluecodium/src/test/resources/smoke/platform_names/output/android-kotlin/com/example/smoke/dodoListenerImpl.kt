/*

 *
 */

@file:JvmName("PlatformNamesListenerImpl")

package com.example.smoke

import com.example.NativeBase

class dodoListenerImpl : NativeBase, dodoListener {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun DodoMethod(DodoParameter: String) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
