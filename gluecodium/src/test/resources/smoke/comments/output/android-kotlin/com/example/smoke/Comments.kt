/*

 *
 */

@file:JvmName("comments")

package com.example.smoke

import com.example.NativeBase

class Comments : NativeBase {

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
    class SomethingWrongException(@JvmField val error: Comments.SomeEnum) : Exception(error.toString())


    class SomeStruct {
        @JvmField var someField: Boolean
        @JvmField var nullableField: String?



        constructor(someField: Boolean) {
            this.someField = someField
            this.nullableField = null
        }



        external fun someStructMethod() : Unit


        companion object {
            @JvmStatic external fun someStaticStructMethod() : Unit
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

        override val onlyGetterProperty: Int
            external get

        override var isIsVisible: Boolean
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



    @Throws (Comments.SomethingWrongException::class) external fun someMethodWithAllComments(inputParameter: String) : Boolean
    external fun someMethodWithInputComments(input: String) : Boolean
    external fun someMethodWithOutputComments(input: String) : Boolean
    external fun someMethodWithNoComments(input: String) : Boolean
    external fun someMethodWithoutReturnTypeWithAllComments(input: String) : Unit
    external fun someMethodWithoutReturnTypeWithNoComments(input: String) : Unit
    external fun someMethodWithoutInputParametersWithAllComments() : Boolean
    external fun someMethodWithoutInputParametersWithNoComments() : Boolean
    external fun someMethodWithNothing() : Unit
    external fun someMethodWithoutReturnTypeOrInputParameters() : Unit
    external fun oneParameterCommentOnly(undocumented: String, documented: String) : String
    external fun returnCommentOnly(undocumented: String) : String

    var isSomeProperty: Boolean
        external get
        external set

    val onlyGetterProperty: Int
        external get

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
