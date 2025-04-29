/*

 *
 */

@file:JvmName("DeprecationComments")

package com.example.smoke


/**
 * This is some very useful interface.
 */
@Deprecated("Unfortunately, this interface is deprecated. Use [com.example.smoke.Comments] instead.")
interface DeprecationComments {
    /**
     * This is some very useful enum.
     */
    @Deprecated("Unfortunately, this enum is deprecated. Use [com.example.smoke.Comments.SomeEnum] instead.")
    enum class SomeEnum(private val value: Int) {
        /**
         * Not quite useful
         */
        @Deprecated("Unfortunately, this item is deprecated.\nUse [com.example.smoke.Comments.SomeEnum.USELESS] instead.")
        USELESS(0);
    }
    @Deprecated("Unfortunately, this exception is deprecated, please use [com.example.smoke.Comments.SomethingWrongException] instead.")
    class SomethingWrongException(@JvmField val error: DeprecationComments.SomeEnum) : Exception(error.toString())


    class SomeStruct {
        @JvmField var someField: Boolean



        constructor() {
            this.someField = false
        }





    }


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

