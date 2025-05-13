/*

 *
 */

@file:JvmName("AttributesStruct")

package com.example.smoke


class AttributesStruct {
    @JvmField var field: String



    constructor(field: String) {
        this.field = field
    }





    external fun veryFun(param: String) : Unit


    companion object {
        @JvmField final val PI: Boolean = false
    }
}

