/*

 *
 */

@file:JvmName("CommentsTable")

package com.example.smoke

import com.example.NativeBase

/**
 * Something lorem something ipsum.
 *
 * | Tables | Are | Cool |
 * |----------|:-------------:|------:|
 * | col 1 is |  left-aligned | $1600 |
 * | col 2 is |    centered   |   $12 |
 * | col 3 is | right-aligned |    $1 |
 */
class CommentsTable : NativeBase {



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
