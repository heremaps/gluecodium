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

    @Throws (ErrorsInterface.InternalException::class) override external fun methodWithErrors() : Unit
    @Throws (ErrorsInterface.ExternalException::class) override external fun methodWithExternalErrors() : Unit
    @Throws (ErrorsInterface.InternalException::class) override external fun methodWithErrorsAndReturnValue() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @Throws (WithPayloadException::class) @JvmStatic external fun methodWithPayloadError() : Unit
        @Throws (WithPayloadException::class) @JvmStatic external fun methodWithPayloadErrorAndReturnValue() : String
    }
}
