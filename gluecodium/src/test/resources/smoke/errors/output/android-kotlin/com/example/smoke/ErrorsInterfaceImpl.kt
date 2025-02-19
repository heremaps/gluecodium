/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class ErrorsInterfaceImpl : NativeBase, ErrorsInterface {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun methodWithErrors() : Unit
    override external fun methodWithExternalErrors() : Unit
    override external fun methodWithErrorsAndReturnValue() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun methodWithPayloadError() : Unit
        @JvmStatic external fun methodWithPayloadErrorAndReturnValue() : String
    }
}
