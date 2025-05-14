/*

 *
 */

@file:JvmName("MultipleAttributesKotlin")

package com.example.smoke

import com.example.NativeBase

class MultipleAttributesKotlin : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    @Foo
    @Bar

    external fun noLists2() : Unit

    @Foo
    @Bar
    @Baz

    external fun noLists3() : Unit

    @Foo
    @Bar
    @Baz

    external fun listFirst() : Unit

    @Foo
    @Bar
    @Baz

    external fun listSecond() : Unit

    @Foo
    @Bar
    @Baz
    @Fizz

    external fun twoLists() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

