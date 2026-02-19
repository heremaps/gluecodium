/*

 *
 */

@file:JvmName("InternalInterfaceParentExtensions")


package com.example.smoke

import com.example.NativeBase

internal interface InternalInterfaceParent {



    @JvmSynthetic fun fooBar() : Unit

    var prop: String
        get
        set


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class InternalInterfaceParentImpl : NativeBase, InternalInterfaceParent {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    @JvmSynthetic override external fun fooBar() : Unit

    override var prop: String
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
