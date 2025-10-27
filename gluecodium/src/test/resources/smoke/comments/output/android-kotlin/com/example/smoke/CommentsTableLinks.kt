/*

 *
 */

@file:JvmName("CommentsTableLinksExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * Something lorem something ipsum.
 *
 * | Tables | Are | Cool |
 * |----------|:-------------:|------:|
 * | col 1 is |  [com.example.smoke.CommentsTable] | $1600 |
 * | col 2 is |[com.example.smoke.Comments.SomeEnum]|   $12 |
 * | col 3 is |[com.example.smoke.Comments.SomeEnum.USEFUL]|    $1 |
 */
class CommentsTableLinks : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

