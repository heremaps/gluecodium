/*

 *
 */

@file:JvmName("CommentsLinks")

package com.example.smoke

import com.example.NativeBase

class CommentsLinks : NativeBase {

    class RandomStruct {
        @JvmField var randomField: Comments.SomeStruct



        constructor(randomField: Comments.SomeStruct) {
            this.randomField = randomField
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



    @Throws (Comments.SomethingWrongException::class) external fun randomMethod(inputParameter: Comments.SomeEnum) : Comments.SomeEnum
    external fun randomMethod(text: String, flag: Boolean) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
