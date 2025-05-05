/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class Errors : NativeBase {

    enum class InternalErrorCode(private val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(1);
    }
    enum class ExternalErrors(private val value: Int) {
        NONE(0),
        BOOM(1),
        BUST(2);
    }
    class InternalException(val error: Errors.InternalErrorCode) : Exception(error.toString())


    class ExternalException(val error: Errors.ExternalErrors) : Exception(error.toString())




    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @Throws (Errors.InternalException::class) @JvmStatic external fun methodWithErrors() : Unit
        @Throws (Errors.ExternalException::class) @JvmStatic external fun methodWithExternalErrors() : Unit
        @Throws (Errors.InternalException::class) @JvmStatic external fun methodWithErrorsAndReturnValue() : String
        @Throws (WithPayloadException::class) @JvmStatic external fun methodWithPayloadError() : Unit
        @Throws (WithPayloadException::class) @JvmStatic external fun methodWithPayloadErrorAndReturnValue() : String
    }
}
