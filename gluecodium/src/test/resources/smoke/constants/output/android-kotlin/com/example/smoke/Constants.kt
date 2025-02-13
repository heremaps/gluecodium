/*

 *
 */

package com.example.smoke


class Constants {

    enum class StateEnum(private val value: Int) {
        OFF(0),
        ON(1);
    }


    companion object {
        val BOOL_CONSTANT: Boolean = true
        val INT_CONSTANT: Int = -11
        val UINT_CONSTANT: Long = 4294967295L
        val FLOAT_CONSTANT: Float = 2.71f
        val DOUBLE_CONSTANT: Double = -3.14
        val STRING_CONSTANT: String = "Foo bar"
        val ENUM_CONSTANT: Constants.StateEnum = Constants.StateEnum.ON
    }

}


