/*

 *
 */

@file:JvmName("OuterInternalInterfaceImplExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

/**
 * @suppress
 */
@MySmokeTestsInternalApi
internal class OuterInternalInterfaceImpl : NativeBase, OuterInternalInterface {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun someFunction() : Int



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
