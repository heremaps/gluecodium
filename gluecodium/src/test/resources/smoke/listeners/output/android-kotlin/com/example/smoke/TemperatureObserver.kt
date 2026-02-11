/*

 *
 */

@file:JvmName("TemperatureObserverExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * Observer interface for monitoring changes in thermometer ("Observer of subject").
 */
fun interface TemperatureObserver {



    fun onTemperatureUpdate(thermometer: Thermometer) : Unit


}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class TemperatureObserverImpl : NativeBase, TemperatureObserver {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun onTemperatureUpdate(thermometer: Thermometer) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
