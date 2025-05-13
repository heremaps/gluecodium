/*

 *
 */

@file:JvmName("AttributesInterface")

package com.example.smoke


interface AttributesInterface {



    fun veryFun(param: String) : Unit

    var prop: String
        get
        set


    companion object {
        @JvmField final val PI: Boolean = false
    }
}

