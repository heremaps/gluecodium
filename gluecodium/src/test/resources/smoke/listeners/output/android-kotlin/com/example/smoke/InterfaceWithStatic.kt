/*

 *
 */

@file:JvmName("InterfaceWithStatic")

package com.example.smoke


interface InterfaceWithStatic {

    fun regularFunction() : String

    var regularProperty: String
        get
        set


    companion object {
        @JvmStatic fun staticFunction() : String {
            return InterfaceWithStaticImpl.staticFunction()
        }

        @JvmStatic fun getStaticProperty(): String {
            return InterfaceWithStaticImpl.staticProperty
        }

        @JvmStatic fun setStaticProperty(value: String) {
            InterfaceWithStaticImpl.staticProperty = value
        }
    }
}

