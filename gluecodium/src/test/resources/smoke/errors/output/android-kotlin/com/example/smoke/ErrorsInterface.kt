/*

 *
 */

@file:JvmName("ErrorsInterface")

package com.example.smoke


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

