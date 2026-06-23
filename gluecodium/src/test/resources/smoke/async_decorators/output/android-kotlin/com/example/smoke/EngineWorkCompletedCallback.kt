/*

 *
 */

@file:JvmName("EngineWorkCompletedCallbackExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * A function, which is called when the asynchronous processing is done by the engine.
 * Outcome of engine work is list of strings.
 */
fun interface EngineWorkCompletedCallback {
    /**
     * A function, which is called when the asynchronous processing is done by the engine.
     * Outcome of engine work is list of strings.
     * @param engineError The error in case of a failure. It is `null` for an operation that succeeds.
     * @param engineResult The result from engine. It is `null` in case of an error.
     */

    fun apply(engineError: EngineError?, engineResult: List<String>?) : Unit
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class EngineWorkCompletedCallbackImpl : NativeBase, EngineWorkCompletedCallback {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    /**
     * A function, which is called when the asynchronous processing is done by the engine.
     * Outcome of engine work is list of strings.
     * @param engineError The error in case of a failure. It is `null` for an operation that succeeds.
     * @param engineResult The result from engine. It is `null` in case of an error.
     */

    override external fun apply(engineError: EngineError?, engineResult: List<String>?) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
