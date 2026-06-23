/*

 *
 */

@file:JvmName("CoolEngineExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * An engine class, which offers users some asynchronous processing.
 */
class CoolEngine : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * A function, which downloads some 'cool labels' from the given url.
     * When it finishes, the 'callback' is called.
     * It returns the 'AsyncTaskHandle' which allows checking the status and cancelling the async task.
     * @param url
     * @param callback
     * @return
     */

    external fun downloadCoolLabelsAsync(url: String, callback: EngineWorkCompletedCallback) : AsyncTaskHandle




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

