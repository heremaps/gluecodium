/*

 *
 */

@file:JvmName("CollectionConstantsExtensions")

package com.example.smoke

import com.example.NativeBase

class CollectionConstants : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmField final val LIST_CONSTANT: List<@JvmSuppressWildcards String> = listOf("foo", "bar")
        @JvmField final val SET_CONSTANT: Set<@JvmSuppressWildcards String> = setOf("foo", "bar")
        @JvmField final val MAP_CONSTANT: Map<@JvmSuppressWildcards String, @JvmSuppressWildcards String> = mapOf("foo" to "bar")
        @JvmField final val MIXED_CONSTANT: Map<@JvmSuppressWildcards List<@JvmSuppressWildcards String>, @JvmSuppressWildcards Set<@JvmSuppressWildcards String>> = mapOf(listOf("foo") to setOf("bar"))
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


