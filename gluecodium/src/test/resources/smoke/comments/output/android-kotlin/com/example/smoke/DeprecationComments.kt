/*

 *
 */

@file:JvmName("DeprecationCommentsExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * This is some very useful interface.
 */
@Deprecated("Unfortunately, this interface is deprecated. Use [com.example.smoke.Comments] instead.")
interface DeprecationComments {
    /**
     * This is some very useful enum.
     */
    @Deprecated("Unfortunately, this enum is deprecated. Use [com.example.smoke.Comments.SomeEnum] instead.")
    enum class SomeEnum(@JvmField val value: Int) {
        /**
         * Not quite useful
         */
        @Deprecated("Unfortunately, this item is deprecated.\nUse [com.example.smoke.Comments.SomeEnum.USELESS] instead.")
        USELESS(0);
    }
    @Deprecated("Unfortunately, this exception is deprecated, please use [com.example.smoke.Comments.SomethingWrongException] instead.")
    class SomethingWrongException(@JvmField val error: DeprecationComments.SomeEnum) : Exception(error.toString())


    /**
     * This is some very useful struct.
     */
    @Deprecated("Unfortunately, this struct is deprecated. Use [com.example.smoke.Comments.SomeStruct] instead.")
    class SomeStruct {
        /**
         * How useful this struct is.
         */
        @Deprecated("Unfortunately, this field is deprecated.\nUse [com.example.smoke.Comments.SomeStruct.someField] instead.")
        @JvmField var someField: Boolean



        constructor() {
            this.someField = false
        }





    }


    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated("Unfortunately, this method is deprecated.\nUse [com.example.smoke.Comments.someMethodWithAllComments] instead.")

    fun someMethodWithAllComments(input: String) : Boolean

    /**
     * Some very useful property.
     */
    @Deprecated("Unfortunately, this property is deprecated.\nUse [com.example.smoke.Comments.isSomeProperty] instead.")
    var isSomeProperty: Boolean
        get
        set

    /**
     * Describes the property but not accessors.
     */
    @Deprecated("Will be removed in v3.2.1.")
    var propertyButNotAccessors: String
        get
        set


    companion object {
        /**
         * This is some very useful constant.
         */
        @Deprecated("Unfortunately, this constant is deprecated. Use [com.example.smoke.Comments.VERY_USEFUL] instead.")
        @JvmField final val VERY_USEFUL: Boolean = true
    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class DeprecationCommentsImpl : NativeBase, DeprecationComments {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated("Unfortunately, this method is deprecated.\nUse [com.example.smoke.Comments.someMethodWithAllComments] instead.")

    override external fun someMethodWithAllComments(input: String) : Boolean

    /**
     * Some very useful property.
     */
    @Deprecated("Unfortunately, this property is deprecated.\nUse [com.example.smoke.Comments.isSomeProperty] instead.")
    override var isSomeProperty: Boolean
        external get
        external set

    /**
     * Describes the property but not accessors.
     */
    @Deprecated("Will be removed in v3.2.1.")
    override var propertyButNotAccessors: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
