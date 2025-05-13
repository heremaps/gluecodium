/*

 *
 */

@file:JvmName("ErrorsInterfaceImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class ErrorsInterfaceImpl : NativeBase, ErrorsInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    @Throws(ErrorsInterface.InternalException::class)
    override external fun methodWithErrors() : Unit

    @Throws(ErrorsInterface.ExternalException::class)
    override external fun methodWithExternalErrors() : Unit

    @Throws(ErrorsInterface.InternalException::class)
    override external fun methodWithErrorsAndReturnValue() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @Throws(WithPayloadException::class)
        @JvmStatic external fun methodWithPayloadError() : Unit

        @Throws(WithPayloadException::class)
        @JvmStatic external fun methodWithPayloadErrorAndReturnValue() : String
    }
}
