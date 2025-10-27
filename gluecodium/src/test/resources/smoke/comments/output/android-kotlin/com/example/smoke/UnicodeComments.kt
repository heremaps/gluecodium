/*

 *
 */

@file:JvmName("UnicodeCommentsExtensions")

package com.example.smoke

import com.example.NativeBase

class UnicodeComments : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * Süßölgefäß
     * @param input שלום
     * @return товарищ
     * @throws Comments.SomethingWrongException ネコ
     */
    @Throws(Comments.SomethingWrongException::class)
    external fun someMethodWithAllComments(input: String) : Boolean




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

