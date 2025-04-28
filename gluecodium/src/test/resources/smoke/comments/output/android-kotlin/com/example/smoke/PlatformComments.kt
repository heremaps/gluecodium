/*

 *
 */

@file:JvmName("PlatformComments")

package com.example.smoke

import com.example.NativeBase

class PlatformComments : NativeBase {

    enum class SomeEnum(private val value: Int) {
        USELESS(0),
        USEFUL(1);
    }
    class SomethingWrongException(@JvmField val error: PlatformComments.SomeEnum) : Exception(error.toString())


    class Something {
        @JvmField var nothing: String



        constructor(nothing: String) {
            this.nothing = nothing
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



    external fun doNothing() : Unit
    external fun doMagic() : Unit
    @Throws (PlatformComments.SomethingWrongException::class) external fun someMethodWithAllComments(input: String) : Boolean
    external fun someDeprecatedMethod() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
