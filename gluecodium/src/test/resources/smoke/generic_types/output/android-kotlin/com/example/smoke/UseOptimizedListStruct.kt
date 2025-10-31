/*

 *
 */

@file:JvmName("UseOptimizedListStructExtensions")

package com.example.smoke

import com.example.AbstractNativeList

class UseOptimizedListStruct {
    @JvmField val structs: List<@JvmSuppressWildcards VeryBigStruct>
    @JvmField val classes: List<@JvmSuppressWildcards UnreasonablyLazyClass>



    constructor(structs: List<@JvmSuppressWildcards VeryBigStruct>, classes: List<@JvmSuppressWildcards UnreasonablyLazyClass>) {
        this.structs = structs
        this.classes = classes
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

    private class UnreasonablyLazyClassLazyNativeList : AbstractNativeList<UnreasonablyLazyClass> {

        private constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override protected external fun obtainSize(): Int
        override external fun get(index: Int): UnreasonablyLazyClass

        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }

    }


}

