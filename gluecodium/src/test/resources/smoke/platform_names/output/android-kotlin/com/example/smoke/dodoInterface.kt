/*

 *
 */

@file:JvmName("PlatformNamesInterface")

package com.example.smoke

import com.example.NativeBase
import com.example.smoke.dodoInterface
import com.example.smoke.dodoTypes

class dodoInterface : NativeBase {



    constructor(makeParameter: String) : this(make(makeParameter), null as Any?) {
        cacheThisInstance();
    }

    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()


    external fun DodoMethod(DodoParameter: String) : dodoTypes.dodoStruct

    var DODO_PROPERTY: Long
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun make(makeParameter: String) : Long
    }
}
