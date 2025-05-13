/*

 *
 */

@file:JvmName("OuterInterface")

package com.example.smoke

import com.example.NativeBase

interface OuterInterface {
    class InnerClass : NativeBase {



        /**
         * For internal use only.
         * @suppress
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}





        external fun foo(input: String) : String




        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    interface InnerInterface {



        fun foo(input: String) : String


    }

    /**
     * @suppress
     */
    class InnerInterfaceImpl : NativeBase, InnerInterface {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun foo(input: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }



    fun foo(input: String) : String


}

