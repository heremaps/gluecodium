/*

 *
 */

@file:JvmName("ExcludedCommentsOnlyExtensions")


package com.example.smoke

import com.example.NativeBase

class ExcludedCommentsOnly : NativeBase {

    enum class SomeEnum(@JvmField val value: Int) {
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
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class SomeLambdaImpl : NativeBase, SomeLambda {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         *
         * @suppress
         * @param p0
         * @param p1
         * @return
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


