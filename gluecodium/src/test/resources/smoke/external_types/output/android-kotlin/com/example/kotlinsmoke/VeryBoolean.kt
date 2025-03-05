/*

 *
 */

package com.example.kotlinsmoke


class VeryBoolean {
    var value: Boolean


    constructor(value: Boolean) {
        val _other = make(value)
        this.value = _other.value
    }





    companion object {
        @JvmStatic external fun make(value: Boolean) : VeryBoolean
    }
}

