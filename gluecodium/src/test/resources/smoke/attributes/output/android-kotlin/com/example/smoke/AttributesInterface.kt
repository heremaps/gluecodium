/*

 *
 */

@file:JvmName("AttributesInterface")

package com.example.smoke


@OnInterface
interface AttributesInterface {


    @OnFunctionInInterface

    fun veryFun(@OnParameterInInterface param: String) : Unit

    var prop: String
        get
        set


    companion object {
        @OnConstInInterface
        @JvmField final val PI: Boolean = false
    }
}

