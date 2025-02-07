/*

 *
 */

package com.example.smoke

import com.example.NativeBase
import com.example.time.Duration

class DurationMilliseconds : NativeBase {

    class DurationStruct(var durationField: Duration) {




    }




    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}


    external fun durationFunction(input: Duration) : Duration
    external fun nullableDurationFunction(input: Duration?) : Duration?

    var durationProperty: Duration
        external get
        external set


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
