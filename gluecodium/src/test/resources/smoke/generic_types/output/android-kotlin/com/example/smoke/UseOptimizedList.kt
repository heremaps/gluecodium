/*

 *
 */

@file:JvmName("UseOptimizedListExtensions")


package com.example.smoke

import com.example.AbstractNativeList
import com.example.NativeBase

class UseOptimizedList : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}






    private class UnreasonablyLazyClassLazyNativeList : AbstractNativeList<UnreasonablyLazyClass> {

        private constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override protected external fun obtainSize(): Int
        override external fun get(index: Int): UnreasonablyLazyClass

        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }

    }

    private class VeryBigStructLazyNativeList : AbstractNativeList<VeryBigStruct> {

        private constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override protected external fun obtainSize(): Int
        override external fun get(index: Int): VeryBigStruct

        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }

    }


    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun fetchTheBigOnes() : List<VeryBigStruct>


        @JvmStatic external fun getLazyOnes() : List<UnreasonablyLazyClass>
    }
}

