/*

 *
 */

@file:JvmName("VeryBooleanExtensions")


package com.example.kotlinsmoke


internal class VeryBoolean {
    @JvmField var value: Boolean





   constructor(value: Boolean) {
        val _other = make(value)
        this.value = _other.value
    }






    companion object {

        @JvmStatic private external fun make(value: Boolean) : VeryBoolean
    }
}

