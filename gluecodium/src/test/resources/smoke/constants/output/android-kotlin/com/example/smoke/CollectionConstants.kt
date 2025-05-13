/*

 *
 */

@file:JvmName("CollectionConstants")

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
        @JvmField final val LIST_CONSTANT: MutableList<String> = mutableListOf("foo", "bar")
        @JvmField final val SET_CONSTANT: MutableSet<String> = mutableSetOf("foo", "bar")
        @JvmField final val MAP_CONSTANT: MutableMap<String, String> = mutableMapOf("foo" to "bar")
        @JvmField final val MIXED_CONSTANT: MutableMap<MutableList<String>, MutableSet<String>> = mutableMapOf(mutableListOf("foo") to mutableSetOf("bar"))
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

