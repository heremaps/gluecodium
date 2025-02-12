/*

 *
 */

package com.example.smoke


interface ErrorsInterface {
    enum class InternalError(private val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(1);
    }
    enum class ExternalErrors(private val value: Int) {
        NONE(0),
        BOOM(1),
        BUST(2);
    }
    class InternalException(val error: ErrorsInterface.InternalError) : Exception(error.toString())


    class ExternalException(val error: ErrorsInterface.ExternalErrors) : Exception(error.toString())



    fun methodWithErrors() : Unit
    fun methodWithExternalErrors() : Unit
    fun methodWithErrorsAndReturnValue() : String


    companion object {
        val ERROR_MESSAGE: String = "Some error message constant"
        @JvmStatic fun methodWithPayloadError() : Unit {
            ErrorsInterfaceImpl.methodWithPayloadError()
        }

        @JvmStatic fun methodWithPayloadErrorAndReturnValue() : String {
            return ErrorsInterfaceImpl.methodWithPayloadErrorAndReturnValue()
        }

    }
}

