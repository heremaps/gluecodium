/*

 *
 */

@file:JvmName("OuterPublicClazzExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi
import com.example.NativeBase

class OuterPublicClazz : NativeBase {

    @MySmokeTestsInternalApi
    internal class InnerInternalClazz : NativeBase {



        /**
         * For internal use only.
         * @suppress
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}





        @JvmSynthetic @JvmName("someFunction") internal external fun someFunction() : Boolean




        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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

