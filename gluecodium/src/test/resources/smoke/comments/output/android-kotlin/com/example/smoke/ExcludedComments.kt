/*

 *
 */

@file:JvmName("ExcludedCommentsExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is some very useful class.
 * @suppress
 */
class ExcludedComments : NativeBase {

    /**
     * This is some very useful enum.
     * @suppress
     */
    enum class SomeEnum(@JvmField val value: Int) {
        /**
         * Not quite useful
         * @suppress
         */
        USELESS(0);
    }
    /**
     * This is some very useful exception.
     * @suppress
     */
    class SomethingWrongException(@JvmField val error: ExcludedComments.SomeEnum) : Exception(error.toString())


    /**
     * This is some very useful struct.
     * @suppress
     */
    class SomeStruct {
        /**
         * How useful this struct is
         * remains to be seen
         * @suppress
         */
        @JvmField var someField: Boolean



        /**
         * This is how easy it is to construct.
         * @param someField How useful this struct is
         * remains to be seen
         */
        constructor(someField: Boolean) {
            this.someField = someField
        }





    }

    /**
     * This is some very useful lambda that does it.
     * @suppress
     */
    fun interface SomeLambda {
        /**
         * This is some very useful lambda that does it.
         * @suppress
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
         * @suppress
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
     * @suppress
     * @param inputParameter Very useful input parameter
     * @return Usefulness of the input
     * @throws ExcludedComments.SomethingWrongException Sometimes it happens.
     */
    @Throws(ExcludedComments.SomethingWrongException::class)
    external fun someMethodWithAllComments(inputParameter: String) : Boolean
    /**
     * This is some very useful method that does nothing.
     * @suppress
     */

    external fun someMethodWithoutReturnTypeOrInputParameters() : Unit

    /**
     * Some very useful property.
     * @suppress
     */
    var isSomeProperty: Boolean
        external get
        external set




    companion object {
        /**
         * This is some very useful constant.
         * @suppress
         */
        @JvmField final val VERY_USEFUL: Boolean = true
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


