/*

 *
 */

@file:JvmName("OuterInternalInterfaceExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

@MySmokeTestsInternalApi
internal interface OuterInternalInterface {



    @JvmSynthetic fun someFunction() : Int

    var someProperty: Int
        get
        set


    companion object {


        @JvmStatic @JvmSynthetic fun getSomeStaticProperty() : Int {
            return OuterInternalInterfaceImpl.getSomeStaticProperty()
        }



        @JvmStatic @JvmSynthetic fun setSomeStaticProperty(value: Int) : Unit {
            OuterInternalInterfaceImpl.setSomeStaticProperty(value)
        }

    }
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

    override var someProperty: Int
        external get
        external set



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic @JvmSynthetic @JvmName("getSomeStaticProperty") internal external fun getSomeStaticProperty() : Int

        @JvmStatic @JvmSynthetic @JvmName("setSomeStaticProperty") internal external fun setSomeStaticProperty(value: Int) : Unit
    }
}
