/*

 *
 */

@file:JvmName("Constants")

package com.example.smoke


class Constants {

    enum class StateEnum(private val value: Int) {
        OFF(0),
        ON(1);
    }







    companion object {
        @JvmField final val BOOL_CONSTANT: Boolean = true
        @JvmField final val INT_CONSTANT: Int = -11
        @JvmField final val UINT_CONSTANT: Long = 4294967295L
        @JvmField final val FLOAT_CONSTANT: Float = 2.71f
        @JvmField final val DOUBLE_CONSTANT: Double = -3.14
        @JvmField final val STRING_CONSTANT: String = "Foo bar"
        @JvmField final val ENUM_CONSTANT: Constants.StateEnum = Constants.StateEnum.ON
    }
}

