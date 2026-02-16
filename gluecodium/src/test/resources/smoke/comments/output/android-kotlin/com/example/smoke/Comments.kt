/*

 *
 */

@file:JvmName("commentsExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is some very useful .
 */
class Comments : NativeBase {

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
     * This is some very useful exception.
     */
    class SomethingWrongException(@JvmField val error: Comments.SomeEnum) : Exception(error.toString())


    /**
     * This is some very useful struct.
     */
    class SomeStruct {
        /**
         * How useful this struct is
         * remains to be seen
         */
        @JvmField var someField: Boolean
        /**
         * Can be `null`
         */
        @JvmField var nullableField: String?



        /**
         * This is how easy it is to construct.
         * @param someField How useful this struct is
         * remains to be seen
         */
        constructor(someField: Boolean) {
            this.someField = someField
            this.nullableField = null
        }



        /**
         * This is some struct method that does nothing.
         */

        external fun someStructMethod() : Unit


        companion object {
            /**
             * This is some static struct method that does nothing.
             */

            @JvmStatic external fun someStaticStructMethod() : Unit
        }
    }

    /**
     * This is some very useful lambda that does it.
     */
    fun interface SomeLambda {
        /**
         * This is some very useful lambda that does it.
         * @param p0 Very useful input parameter
         * @param p1 Slightly less useful input parameter
         * @return Usefulness of the input
         */

        fun apply(p0: String, p1: Int) : Double
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class SomeLambdaImpl : NativeBase, SomeLambda {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * This is some very useful lambda that does it.
         * @param p0 Very useful input parameter
         * @param p1 Slightly less useful input parameter
         * @return Usefulness of the input
         */

        override external fun apply(p0: String, p1: Int) : Double



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }


    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param inputParameter Very useful input parameter
     * @return Usefulness of the input
     * @throws Comments.SomethingWrongException Sometimes it happens.
     */
    @Throws(Comments.SomethingWrongException::class)
    external fun someMethodWithAllComments(inputParameter: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return
     */

    external fun someMethodWithInputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return Usefulness of the input
     */

    external fun someMethodWithOutputComments(input: String) : Boolean
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return
     */

    external fun someMethodWithNoComments(input: String) : Boolean
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input Very useful input parameter
     */

    external fun someMethodWithoutReturnTypeWithAllComments(input: String) : Unit
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input
     */

    external fun someMethodWithoutReturnTypeWithNoComments(input: String) : Unit
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return Usefulness of the input
     */

    external fun someMethodWithoutInputParametersWithAllComments() : Boolean
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return
     */

    external fun someMethodWithoutInputParametersWithNoComments() : Boolean


    external fun someMethodWithNothing() : Unit
    /**
     * This is some very useful method that does nothing.
     */

    external fun someMethodWithoutReturnTypeOrInputParameters() : Unit
    /**
     *
     * @param undocumented
     * @param documented nicely documented
     * @return
     */

    external fun oneParameterCommentOnly(undocumented: String, documented: String) : String
    /**
     *
     * @param undocumented
     * @return nicely documented
     */

    external fun returnCommentOnly(undocumented: String) : String

    /**
     * Some very useful property.
     * Note: without these comments user may not be able to use it correctly.
     * Note: that's serious.
     * Therefore, these lines above getter/setter need to be rendered in the output files.
     */
    var isSomeProperty: Boolean
        external get
        external set

    /**
     * OnlyGetterProperty, which does not have a setter.
     * The generated documentation for this property should only be added to property or getter.
     */
    val onlyGetterProperty: Int
        external get

    /**
     * A flag that determines if [com.example.smoke.Comments.onlyGetterProperty] is visible on the screen.
     * By default it is set to `false`. In this case the mentioned thing is not visible on the
     * screen except the case when another flag called [com.example.smoke.Comments.isSomeProperty] forces it.
     * When set to `true` then it is always visible.
     *
     * The additional information about usage of the visibility flag is described here. It contains a lot
     * of references. For instance, if [com.example.smoke.Comments.isSomeProperty] is
     * then it is not visible even if flag is set to `true`.
     */
    var isIsVisible: Boolean
        external get
        external set




    companion object {
        /**
         * This is some very useful constant.
         */
        @JvmField final val VERY_USEFUL: Boolean = true
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


