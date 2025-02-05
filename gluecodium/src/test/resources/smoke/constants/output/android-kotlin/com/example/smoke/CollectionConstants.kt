/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class CollectionConstants : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    companion object {
        val LIST_CONSTANT: List<String> = listOf("foo", "bar")
        val SET_CONSTANT: Set<String> = setOf("foo", "bar")
        val MAP_CONSTANT: Map<String, String> = mapOf("foo" to "bar")
        val MIXED_CONSTANT: Map<List<String>, Set<String>> = mapOf(listOf("foo") to setOf("bar"))
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
