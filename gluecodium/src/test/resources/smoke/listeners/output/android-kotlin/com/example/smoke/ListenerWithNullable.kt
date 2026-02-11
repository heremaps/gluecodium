/*

 *
 */

@file:JvmName("ListenerWithNullableExtensions")


package com.example.smoke

import com.example.NativeBase

interface ListenerWithNullable {



    fun methodWithByte(input: Byte?) : Byte?


    fun methodWithUByte(input: Short?) : Short?


    fun methodWithShort(input: Short?) : Short?


    fun methodWithUShort(input: Int?) : Int?


    fun methodWithInt(input: Int?) : Int?


    fun methodWithUInt(input: Long?) : Long?


    fun methodWithLong(input: Long?) : Long?


    fun methodWithULong(input: Long?) : Long?


    fun methodWithDouble(input: Boolean?) : Boolean?


    fun methodWithFloat(input: Float?) : Float?


    fun methodWithDouble(input: Double?) : Double?


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class ListenerWithNullableImpl : NativeBase, ListenerWithNullable {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun methodWithByte(input: Byte?) : Byte?


    override external fun methodWithUByte(input: Short?) : Short?


    override external fun methodWithShort(input: Short?) : Short?


    override external fun methodWithUShort(input: Int?) : Int?


    override external fun methodWithInt(input: Int?) : Int?


    override external fun methodWithUInt(input: Long?) : Long?


    override external fun methodWithLong(input: Long?) : Long?


    override external fun methodWithULong(input: Long?) : Long?


    override external fun methodWithDouble(input: Boolean?) : Boolean?


    override external fun methodWithFloat(input: Float?) : Float?


    override external fun methodWithDouble(input: Double?) : Double?



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
