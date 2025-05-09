/*

 *
 */

@file:JvmName("ListenerWithNullableImpl")

package com.example.smoke

import com.example.NativeBase

class ListenerWithNullableImpl : NativeBase, ListenerWithNullable {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
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
