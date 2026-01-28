/*

 *
 */

@file:JvmName("OuterInternalInterfaceImplExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

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



    @JvmSynthetic override external fun someFunction() : Int

    override var someProperty: Int
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
