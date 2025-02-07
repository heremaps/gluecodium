/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class BasicTypes : NativeBase {



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
        @JvmStatic external fun stringFunction(input: String) : String
        @JvmStatic external fun boolFunction(input: Boolean) : Boolean
        @JvmStatic external fun floatFunction(input: Float) : Float
        @JvmStatic external fun doubleFunction(input: Double) : Double
        @JvmStatic external fun byteFunction(input: Byte) : Byte
        @JvmStatic external fun shortFunction(input: Short) : Short
        @JvmStatic external fun intFunction(input: Int) : Int
        @JvmStatic external fun longFunction(input: Long) : Long
        @JvmStatic external fun ubyteFunction(input: Short) : Short
        @JvmStatic external fun ushortFunction(input: Int) : Int
        @JvmStatic external fun uintFunction(input: Long) : Long
        @JvmStatic external fun ulongFunction(input: Long) : Long
    }
}
