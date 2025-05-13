/*

 *
 */

@file:JvmName("ConstantsInterface")

package com.example.smoke

import com.example.NativeBase

class ConstantsInterface : NativeBase {

    enum class StateEnum(private val value: Int) {
        OFF(0),
        ON(1);
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
        @JvmField final val BOOL_CONSTANT: Boolean = true
        @JvmField final val INT_CONSTANT: Int = -11
        @JvmField final val UINT_CONSTANT: Long = 4294967295L
        @JvmField final val FLOAT_CONSTANT: Float = 2.71f
        @JvmField final val DOUBLE_CONSTANT: Double = -3.14
        @JvmField final val STRING_CONSTANT: String = "Foo bar"
        @JvmField final val ENUM_CONSTANT: ConstantsInterface.StateEnum = ConstantsInterface.StateEnum.ON
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
