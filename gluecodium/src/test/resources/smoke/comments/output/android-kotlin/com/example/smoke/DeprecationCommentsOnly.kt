/*

 *
 */

@file:JvmName("DeprecationCommentsOnly")

package com.example.smoke


@Deprecated("Unfortunately, this interface is deprecated.")
interface DeprecationCommentsOnly {
    @Deprecated("Unfortunately, this enum is deprecated.")
    enum class SomeEnum(private val value: Int) {
        @Deprecated("Unfortunately, this item is deprecated.")
        USELESS(0);
    }
    @Deprecated("Unfortunately, this struct is deprecated.")
    class SomeStruct {
        @Deprecated("Unfortunately, this field is deprecated.")
        @JvmField var someField: Boolean



        constructor() {
            this.someField = false
        }





    }


    /**
     *
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated("Unfortunately, this method is deprecated.")

    fun someMethodWithAllComments(input: String) : Boolean

    @Deprecated("Unfortunately, this property is deprecated.")
    var isSomeProperty: Boolean
        get
        set


    companion object {
        @Deprecated("Unfortunately, this constant is deprecated.")
        @JvmField final val VERY_USEFUL: Boolean = true
    }
}

