/*

 *
 */

@file:JvmName("FirstParentIsInterfaceInterfaceExtensions")

package com.example.smoke


interface FirstParentIsInterfaceInterface : ParentInterface, ParentNarrowOne {



    fun childFunction() : Unit

    var childProperty: String
        get
        set


}

