/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class InheritFromSkippedImpl : NativeBase, InheritFromSkipped {
    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    override external fun notInJava(input: String) : String
    override external fun notInSwift(input: Boolean) : Boolean
    override external fun notInDart(input: Float) : Float
    override var skippedInJava: String
        external get
        external set
    override var isSkippedInSwift: Boolean
        external get
        external set
    override var skippedInDart: Float
        external get
        external set

    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
