/*

 *
 */

@file:JvmName("Dates")

package com.example.smoke

import com.example.NativeBase
import java.util.Date

class Dates : NativeBase {

    class DateStruct {
        @JvmField var dateField: Date
        @JvmField var nullableDateField: Date?



        constructor(dateField: Date) {
            this.dateField = dateField
            this.nullableDateField = null
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





    external fun dateMethod(input: Date) : Date


    external fun nullableDateMethod(input: Date?) : Date?

    var dateProperty: Date
        external get
        external set

    var dateSet: MutableSet<Date>
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

