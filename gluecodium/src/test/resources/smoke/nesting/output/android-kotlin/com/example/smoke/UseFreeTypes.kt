/*

 *
 */

@file:JvmName("UseFreeTypes")

package com.example.smoke

import com.example.NativeBase
import java.util.Date

class UseFreeTypes : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    @Throws(FreeException::class)
    external fun doStuff(point: FreePoint, mode: FreeEnum) : Date




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
