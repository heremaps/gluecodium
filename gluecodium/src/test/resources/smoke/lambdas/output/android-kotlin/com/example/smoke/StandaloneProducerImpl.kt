/*

 *
 */

@file:JvmName("StandaloneProducerImpl")

package com.example.smoke

import com.example.NativeBase

class StandaloneProducerImpl : NativeBase, StandaloneProducer {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    override external fun apply() : String



    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
