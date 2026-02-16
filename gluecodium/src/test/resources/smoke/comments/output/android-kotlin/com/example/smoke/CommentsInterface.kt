/*

 *
 */

@file:JvmName("CommentsInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is some very useful interface.
 */
interface CommentsInterface {
    /**
     * This is some very useful enum.
     */
    enum class SomeEnum(@JvmField val value: Int) {
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

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class CommentsInterfaceImpl : NativeBase, CommentsInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */

    override external fun someMethodWithAllComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return
     */

    override external fun someMethodWithInputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return Usefulness of the input
     */

    override external fun someMethodWithOutputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return
     */

    override external fun someMethodWithNoComments(input: String) : Boolean
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input Very useful input parameter
     */

    override external fun someMethodWithoutReturnTypeWithAllComments(input: String) : Unit
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input
     */

    override external fun someMethodWithoutReturnTypeWithNoComments(input: String) : Unit
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return Usefulness of the input
     */

    override external fun someMethodWithoutInputParametersWithAllComments() : Boolean
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return
     */

    override external fun someMethodWithoutInputParametersWithNoComments() : Boolean


    override external fun someMethodWithNothing() : Unit
    /**
     * This is some very useful method that does nothing.
     */

    override external fun someMethodWithoutReturnTypeOrInputParameters() : Unit

    /**
     * Some very useful property.
     */
    override var isSomeProperty: Boolean
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
