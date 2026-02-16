/*

 *
 */

@file:JvmName("SkipProxyExtensions")


package com.example.smoke

import com.example.NativeBase

interface SkipProxy {



    fun notInJava(input: String) : String


    fun notInSwift(input: Boolean) : Boolean


    fun notInDart(input: Float) : Float

    var skippedInJava: String
        get
        set

    var isSkippedInSwift: Boolean
        get
        set

    var skippedInDart: Float
        get
        set


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class SkipProxyImpl : NativeBase, SkipProxy {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun notInJava(input: String) : String


    override external fun notInSwift(input: Boolean) : Boolean


    override external fun notInDart(input: Float) : Float

    override var skippedInJava: String
        external get
        external set

    override var isSkippedInSwift: Boolean
        external get
        external set

    override var skippedInDart: Float
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
