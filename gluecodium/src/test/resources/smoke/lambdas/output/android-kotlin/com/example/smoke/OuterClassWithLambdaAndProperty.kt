/*

 *
 */

@file:JvmName("OuterClassWithLambdaAndProperty")

package com.example.smoke

import com.example.NativeBase

class OuterClassWithLambdaAndProperty : NativeBase {

    fun interface SomeInternalLambda {


        fun apply(p0: Int) : Int
    }

    /**
     * @suppress
     */
    class SomeInternalLambdaImpl : NativeBase, SomeInternalLambda {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: Int) : Int



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




    var someInteger: Int
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

