/*

 *
 */

package com.example.smoke

import com.example.AbstractNativeList

class UseOptimizedListStruct {
    val structs: MutableList<VeryBigStruct>
    val classes: MutableList<UnreasonablyLazyClass>



    constructor(structs: MutableList<VeryBigStruct>, classes: MutableList<UnreasonablyLazyClass>) {
        this.structs = structs
        this.classes = classes
    }




    /**
     * @hidden
     */
    private class VeryBigStructLazyNativeList : AbstractNativeList<VeryBigStruct> {

        private constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override protected external fun obtainSize(): Int
        override external fun get(index: Int): VeryBigStruct

        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }

    }

    /**
     * @hidden
     */
    private class UnreasonablyLazyClassLazyNativeList : AbstractNativeList<UnreasonablyLazyClass> {

        private constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override protected external fun obtainSize(): Int
        override external fun get(index: Int): UnreasonablyLazyClass

        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }

    }


}

