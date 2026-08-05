/*

 *
 */

@file:JvmName("AbortableHandleExtensions")


package com.example.coroutines

import com.example.NativeBase

class AbortableHandle : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}





    external fun abort() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

