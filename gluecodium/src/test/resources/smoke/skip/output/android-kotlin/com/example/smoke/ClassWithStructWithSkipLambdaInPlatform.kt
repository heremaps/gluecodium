/*

 *
 */

@file:JvmName("ClassWithStructWithSkipLambdaInPlatformExtensions")

package com.example.smoke

import com.example.NativeBase

class ClassWithStructWithSkipLambdaInPlatform : NativeBase {

    class SkipLambdaInPlatform {
        @JvmField var intField: Int



        constructor(intField: Int) {
            this.intField = intField
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







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

