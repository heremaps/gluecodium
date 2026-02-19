/*

 *
 */

@file:JvmName("OuterInternalInterfaceExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

@MySmokeTestsInternalApi
internal fun interface OuterInternalInterface {



    @JvmSynthetic fun someFunction() : Int


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class OuterInternalInterfaceImpl : NativeBase, OuterInternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    @JvmSynthetic override external fun someFunction() : Int



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
