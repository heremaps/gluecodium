/*

 *
 */

@file:JvmName("DeprecationCommentsOnly")

package com.example.smoke


interface DeprecationCommentsOnly {
    enum class SomeEnum(private val value: Int) {
        USELESS(0);
    }
    class SomeStruct {
        @JvmField var someField: Boolean



        constructor() {
            this.someField = false
        }





    }


    fun someMethodWithAllComments(input: String) : Boolean

    var isSomeProperty: Boolean
        get
        set


    companion object {
        @Deprecated("Unfortunately, this constant is deprecated.")
        @JvmField final val VERY_USEFUL: Boolean = true
    }
}

