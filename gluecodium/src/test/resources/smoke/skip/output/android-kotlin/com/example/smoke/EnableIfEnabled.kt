/*

 *
 */

@file:JvmName("EnableIfEnabled")

package com.example.smoke

import com.example.NativeBase

class EnableIfEnabled : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun enableIfUnquoted() : Unit
        @JvmStatic external fun enableIfUnquotedList() : Unit
        @JvmStatic external fun enableIfQuoted() : Unit
        @JvmStatic external fun enableIfQuotedList() : Unit
        @JvmStatic external fun enableIfTagged() : Unit
        @JvmStatic external fun enableIfTaggedList() : Unit
        @JvmStatic external fun enableIfMixedList() : Unit
    }
}
