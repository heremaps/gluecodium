/*

 *
 */

@file:JvmName("AttributesInterfaceExtensions")

package com.example.smoke


@OnInterface
interface AttributesInterface {


    @OnFunctionInInterface

    fun veryFun(@OnParameterInInterface param: String) : Unit

    @OnPropertyInInterface
    var prop: String
        get
        set


    companion object {
        @OnConstInInterface
        @JvmField final val PI: Boolean = false
    }
}

