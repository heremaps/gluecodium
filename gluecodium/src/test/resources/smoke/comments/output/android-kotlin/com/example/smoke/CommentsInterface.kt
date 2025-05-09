/*

 *
 */

@file:JvmName("CommentsInterface")

package com.example.smoke


/**
 * This is some very useful interface.
 */
interface CommentsInterface {
    /**
     * This is some very useful enum.
     */
    enum class SomeEnum(private val value: Int) {
        /**
         * Not quite useful
         */
        USELESS(0),
        /**
         * Somewhat useful
         */
        USEFUL(1);
    }
    /**
     * This is some very useful struct.
     */
    class SomeStruct {
        /**
         * How useful this struct is
         */
        @JvmField var someField: Boolean



        constructor(someField: Boolean) {
            this.someField = someField
        }





    }


    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */

    fun someMethodWithAllComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return
     */

    fun someMethodWithInputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return Usefulness of the input
     */

    fun someMethodWithOutputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return
     */

    fun someMethodWithNoComments(input: String) : Boolean
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input Very useful input parameter
     */

    fun someMethodWithoutReturnTypeWithAllComments(input: String) : Unit
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input
     */

    fun someMethodWithoutReturnTypeWithNoComments(input: String) : Unit
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return Usefulness of the input
     */

    fun someMethodWithoutInputParametersWithAllComments() : Boolean
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return
     */

    fun someMethodWithoutInputParametersWithNoComments() : Boolean


    fun someMethodWithNothing() : Unit
    /**
     * This is some very useful method that does nothing.
     */

    fun someMethodWithoutReturnTypeOrInputParameters() : Unit

    /**
     * Some very useful property.
     */
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

