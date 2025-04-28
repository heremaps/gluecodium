/*

 *
 */

@file:JvmName("DeprecationComments")

package com.example.smoke


interface DeprecationComments {
    enum class SomeEnum(private val value: Int) {
        USELESS(0);
    }
    class SomethingWrongException(@JvmField val error: DeprecationComments.SomeEnum) : Exception(error.toString())


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

    var propertyButNotAccessors: String
        get
        set


    companion object {
        @JvmField final val VERY_USEFUL: Boolean = true
    }
}

