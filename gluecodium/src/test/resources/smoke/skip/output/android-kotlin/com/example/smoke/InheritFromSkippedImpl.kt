/*

 *
 */

@file:JvmName("InheritFromSkippedImpl")

package com.example.smoke

import com.example.NativeBase

/**
 * @suppress
 */
class InheritFromSkippedImpl : NativeBase, InheritFromSkipped {
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
