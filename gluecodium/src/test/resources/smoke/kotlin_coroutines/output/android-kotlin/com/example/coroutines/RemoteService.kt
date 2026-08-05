/*

 *
 */

@file:JvmName("RemoteServiceExtensions")


package com.example.coroutines

import com.example.NativeBase

fun interface RemoteService {

    /**
     * Checks whether the remote service is currently reachable.
     * @param callback
     */

    fun checkConnection(callback: ErrorOnlyCallback) : Unit



}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class RemoteServiceImpl : NativeBase, RemoteService {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    /**
     * Checks whether the remote service is currently reachable.
     * @param callback
     */

    override external fun checkConnection(callback: ErrorOnlyCallback) : Unit



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
