/*

 *
 */

@file:JvmName("PlatformComments")

package com.example.smoke

import com.example.NativeBase

class PlatformComments : NativeBase {

    enum class SomeEnum(@JvmField val value: Int) {
        USELESS(0),
        USEFUL(1);
    }
    /**
     * An exception when something goes wrong.
     */
    class SomethingWrongException(@JvmField val error: PlatformComments.SomeEnum) : Exception(error.toString())


    /**
     * This is a great struct.
     */
    class Something {
        @JvmField var nothing: String



        constructor(nothing: String) {
            this.nothing = nothing
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



    /**
     * This is some very useless method that makes some tea.
     */

    external fun doNothing() : Unit
    /**
     * Makes some tea.
     */

    external fun doMagic() : Unit
    /**
     * This is some very useful method that measures the usefulness of its input or \esc@pe{s}.
     * @param input Very useful parameter that \[\esc@pe{s}\]
     * @return of the input
     * @throws PlatformComments.SomethingWrongException Sometimes it happens.
     */
    @Throws(PlatformComments.SomethingWrongException::class)
    external fun someMethodWithAllComments(input: String) : Boolean
    /**
     *
     */
    @Deprecated("A very  method that is deprecated.")

    external fun someDeprecatedMethod() : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

