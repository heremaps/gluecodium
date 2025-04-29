/*

 *
 */

@file:JvmName("MultiLineComments")

package com.example.smoke

import com.example.NativeBase

class MultiLineComments : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    /**
     * This is very important method.
     * It has very important parameters.
     * It has side effects.
     * @param input Very useful input parameter.
     *     You must not confuse it with the second parameter.
     *     But they are similar.
     * @param ratio Not as useful as the first parameter.
     *     But still useful.
     *     use a positive value for more happiness.
     * @return If you provide a useful input,
     *     and a useful ratio you can expect a useful output.
     *     Just kidding do not expect anything from a method until
     *     you see its body.
     */
    external fun someMethodWithLongComment(input: String, ratio: Double) : Float




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
