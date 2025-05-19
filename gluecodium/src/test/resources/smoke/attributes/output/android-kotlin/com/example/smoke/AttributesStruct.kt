/*

 *
 */

@file:JvmName("AttributesStruct")

package com.example.smoke


@OnStruct
class AttributesStruct {
    @OnField
    @JvmField var field: String



    constructor(field: String) {
        this.field = field
    }




    @OnFunctionInStruct

    external fun veryFun(@OnParameterInStruct param: String) : Unit


    companion object {
        @OnConstInStruct
        @JvmField final val PI: Boolean = false
    }
}

