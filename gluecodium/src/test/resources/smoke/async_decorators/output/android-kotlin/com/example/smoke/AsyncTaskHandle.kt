/*

 *
 */

@file:JvmName("AsyncTaskHandleExtensions")


package com.example.smoke

import com.example.NativeBase

/**
 * Some class that represents the old-style asynchronous handle.
 * It can be used to check if task is running or has been cancelled.
 * It allows also to cancel the task.
 */
class AsyncTaskHandle : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * Cancels the running asynchronous task.
     * @return
     */

    external fun cancel() : Boolean
    /**
     * Checks if the task has been already cancelled.
     * @return
     */

    external fun isCancelled() : Boolean
    /**
     * Checks if the task is being running just now.
     * @return
     */

    external fun isRunning() : Boolean




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

