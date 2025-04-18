/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class ClassWithStructWithSkipLambdaInPlatform : NativeBase {

    class SkipLambdaInPlatform {
        var intField: Int



        constructor(intField: Int) {
            this.intField = intField
        }




    }



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
    }
}
