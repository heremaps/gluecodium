/*

 *
 */

@file:JvmName("InternalInterfaceWithStructExtensions")


package com.example.smoke

import com.example.NativeBase

internal fun interface InternalInterfaceWithStruct {
    class Payload {
        @JvmField @JvmSynthetic internal var value: Int



        private constructor(value: Int) {
            this.value = value
        }





        internal companion object {
            @JvmSynthetic internal operator fun invoke(value: Int): Payload = Payload(value)
        }
    }




    @JvmSynthetic fun process() : Int


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class InternalInterfaceWithStructImpl : NativeBase, InternalInterfaceWithStruct {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    @JvmSynthetic override external fun process() : Int




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
