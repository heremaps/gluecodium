/*

 *
 */

@file:JvmName("ExcludedComments")

package com.example.smoke

import com.example.NativeBase

class ExcludedComments : NativeBase {

    /**
     * This is some very useful enum.
     * @suppress
     */
    enum class SomeEnum(private val value: Int) {
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


    class SomeStruct {
        @JvmField var someField: Boolean



        constructor(someField: Boolean) {
            this.someField = someField
        }





    }

    fun interface SomeLambda {
        fun apply(p0: String, p1: Int) : Double
    }

    class SomeLambdaImpl : NativeBase, SomeLambda {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String, p1: Int) : Double

        override var isSomeProperty: Boolean
            external get
            external set



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }


    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    @Throws (ExcludedComments.SomethingWrongException::class) external fun someMethodWithAllComments(inputParameter: String) : Boolean
    external fun someMethodWithoutReturnTypeOrInputParameters() : Unit

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
