/*

 *
 */

@file:JvmName("VeryBooleanExtensions")


package com.example.kotlinsmoke


internal class VeryBoolean {
    @JvmField @JvmSynthetic internal var value: Boolean





   private constructor(value: Boolean) {
        val _other = make(value)
        this.value = _other.value
    }






    companion object {

        @JvmStatic @JvmSynthetic @JvmName("make") private external fun make(value: Boolean) : VeryBoolean
        @JvmSynthetic internal operator fun invoke(value: Boolean): VeryBoolean = VeryBoolean(value)
    }
}

