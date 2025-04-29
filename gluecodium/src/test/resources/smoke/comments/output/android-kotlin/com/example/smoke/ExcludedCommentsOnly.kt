/*

 *
 */

@file:JvmName("ExcludedCommentsOnly")

package com.example.smoke

import com.example.NativeBase

class ExcludedCommentsOnly : NativeBase {

    enum class SomeEnum(private val value: Int) {
        USELESS(0);
    }
    class SomethingWrongException(@JvmField val error: ExcludedCommentsOnly.SomeEnum) : Exception(error.toString())


    class SomeStruct {
        @JvmField var someField: Boolean



        constructor(someField: Boolean) {
            this.someField = someField
        }





    }

    fun interface SomeLambda {
        /**
         *
         * @suppress
         * @param p0
         * @param p1
         * @return
         */

        fun apply(p0: String, p1: Int) : Double
    }

    /**
     * @suppress
     */
    class SomeLambdaImpl : NativeBase, SomeLambda {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         *
         * @suppress
         * @param p0
         * @param p1
         * @return
         */

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



    /**
     *
     * @suppress
     * @param inputParameter
     * @return
     * @throws ExcludedCommentsOnly.SomethingWrongException
     */
    @Throws(ExcludedCommentsOnly.SomethingWrongException::class)
    external fun someMethodWithAllComments(inputParameter: String) : Boolean
    /**
     *
     * @suppress
     */

    external fun someMethodWithoutReturnTypeOrInputParameters() : Unit

    var isSomeProperty: Boolean
        external get
        external set




    companion object {
        @JvmField final val VERY_USEFUL: Boolean = true
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
