/*

 *
 */

@file:JvmName("ErrorsInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

interface ErrorsInterface {
    enum class InternalError(@JvmField val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(1);
    }
    enum class ExternalErrors(@JvmField val value: Int) {
        NONE(0),
        BOOM(1),
        BUST(2);
    }
    class InternalException(@JvmField val error: ErrorsInterface.InternalError) : Exception(error.toString())


    class ExternalException(@JvmField val error: ErrorsInterface.ExternalErrors) : Exception(error.toString())




    @Throws(ErrorsInterface.InternalException::class)
    fun methodWithErrors() : Unit

    @Throws(ErrorsInterface.ExternalException::class)
    fun methodWithExternalErrors() : Unit

    @Throws(ErrorsInterface.InternalException::class)
    fun methodWithErrorsAndReturnValue() : String


    companion object {
        @JvmField final val ERROR_MESSAGE: String = "Some error message constant"

        @Throws(WithPayloadException::class)
        @JvmStatic fun methodWithPayloadError() : Unit {
            ErrorsInterfaceImpl.methodWithPayloadError()
        }


        @Throws(WithPayloadException::class)
        @JvmStatic fun methodWithPayloadErrorAndReturnValue() : String {
            return ErrorsInterfaceImpl.methodWithPayloadErrorAndReturnValue()
        }

    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ErrorsInterfaceImpl : NativeBase, ErrorsInterface {
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
