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

        @JvmStatic var staticProperty: String
            get() = InterfaceWithStaticImpl.staticProperty
            set(value) {
                InterfaceWithStaticImpl.staticProperty = value
            }
    }
}

