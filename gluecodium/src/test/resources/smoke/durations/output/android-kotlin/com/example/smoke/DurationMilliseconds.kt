/*

 *
 */

@file:JvmName("DurationMilliseconds")

package com.example.smoke

import com.example.NativeBase
import com.example.time.Duration

class DurationMilliseconds : NativeBase {

    class DurationStruct {
        @JvmField var durationField: Duration



        constructor(durationField: Duration) {
            this.durationField = durationField
        }





    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
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

