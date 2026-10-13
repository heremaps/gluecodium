/*

 *
 */

@file:JvmName("CachedRefClassExtensions")


package com.example.smoke

import com.example.NativeBase

interface CachedRefClass {



    fun getStringValue() : String

    val items: List<String>
        get


    companion object {
    }
}

/**
 * @suppress
 *
 * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
 * It is instantiated by JNI and should not be used by the end users.
 */
private class CachedRefClassImpl : NativeBase, CachedRefClass {
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun getStringValue() : String

    override val items: List<String>
        get() {
            if (!is_cached_items) {
                cache_items = getItems_private()
                is_cached_items = true
            }

            return cache_items!!
        }

    private var is_cached_items = false
    private var cache_items: List<String>? = null
    external private fun getItems_private() : List<String>





    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
