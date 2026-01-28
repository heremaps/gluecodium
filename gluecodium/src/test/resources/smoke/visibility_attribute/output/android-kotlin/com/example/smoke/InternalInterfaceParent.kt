/*

 *
 */

@file:JvmName("InternalInterfaceParentExtensions")


package com.example.smoke


internal interface InternalInterfaceParent {



    @JvmSynthetic fun fooBar() : Unit

    var prop: String
        @JvmSynthetic get
        @JvmSynthetic set


}

