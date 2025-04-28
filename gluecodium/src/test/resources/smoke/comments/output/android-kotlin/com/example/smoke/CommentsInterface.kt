/*

 *
 */

@file:JvmName("CommentsInterface")

package com.example.smoke


interface CommentsInterface {
    enum class SomeEnum(private val value: Int) {
        USELESS(0),
        USEFUL(1);
    }
    class SomeStruct {
        @JvmField var someField: Boolean



        constructor(someField: Boolean) {
            this.someField = someField
        }





    }


    fun someMethodWithAllComments(input: String) : Boolean
    fun someMethodWithInputComments(input: String) : Boolean
    fun someMethodWithOutputComments(input: String) : Boolean
    fun someMethodWithNoComments(input: String) : Boolean
    fun someMethodWithoutReturnTypeWithAllComments(input: String) : Unit
    fun someMethodWithoutReturnTypeWithNoComments(input: String) : Unit
    fun someMethodWithoutInputParametersWithAllComments() : Boolean
    fun someMethodWithoutInputParametersWithNoComments() : Boolean
    fun someMethodWithNothing() : Unit
    fun someMethodWithoutReturnTypeOrInputParameters() : Unit

    var isSomeProperty: Boolean
        get
        set


    companion object {
        /**
         * This is some very useful constant.
         */
        @JvmField final val VERY_USEFUL: Boolean = true
    }
}

