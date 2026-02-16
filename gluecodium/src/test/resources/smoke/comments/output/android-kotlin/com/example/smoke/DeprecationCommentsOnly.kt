/*

 *
 */

@file:JvmName("DeprecationCommentsOnlyExtensions")


package com.example.smoke

import com.example.NativeBase

@Deprecated("Unfortunately, this interface is deprecated.")
interface DeprecationCommentsOnly {
    @Deprecated("Unfortunately, this enum is deprecated.")
    enum class SomeEnum(@JvmField val value: Int) {
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

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class DeprecationCommentsOnlyImpl : NativeBase, DeprecationCommentsOnly {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    /**
     *
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated("Unfortunately, this method is deprecated.")

    override external fun someMethodWithAllComments(input: String) : Boolean

    @Deprecated("Unfortunately, this property is deprecated.")
    override var isSomeProperty: Boolean
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
