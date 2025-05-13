/*

 *
 */

@file:JvmName("Enums")

package com.example.smoke

import com.example.NativeBase

class Enums : NativeBase {

    enum class SimpleEnum(private val value: Int) {
        FIRST(0),
        SECOND(1);
    }
    enum class InternalErrorCode(private val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(999);
    }
    class ErrorStruct {
        @JvmField var type: Enums.InternalErrorCode
        @JvmField var message: String



        constructor(type: Enums.InternalErrorCode, message: String) {
            this.type = type
            this.message = message
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun methodWithEnumeration(input: Enums.SimpleEnum) : Enums.SimpleEnum


        @JvmStatic external fun flipEnumValue(input: Enums.InternalErrorCode) : Enums.InternalErrorCode


        @JvmStatic external fun extractEnumFromStruct(input: Enums.ErrorStruct) : Enums.InternalErrorCode


        @JvmStatic external fun createStructWithEnumInside(type: Enums.InternalErrorCode, message: String) : Enums.ErrorStruct
    }
}
