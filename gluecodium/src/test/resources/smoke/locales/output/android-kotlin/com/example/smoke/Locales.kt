/*

 *
 */

@file:JvmName("Locales")

package com.example.smoke

import com.example.NativeBase
import java.util.Locale

class Locales : NativeBase {

    class LocaleStruct {
        @JvmField var localeField: Locale



        constructor(localeField: Locale) {
            this.localeField = localeField
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





    external fun localeMethod(input: Locale) : Locale

    var localeProperty: Locale
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

