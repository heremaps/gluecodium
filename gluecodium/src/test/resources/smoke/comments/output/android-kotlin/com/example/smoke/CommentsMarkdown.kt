/*

 *
 */

@file:JvmName("CommentsMarkdownExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * First line.
 * Second line.
 *
 * Another paragraph. **bold** and *italic* and `code`.
 *
 * > blockquote
 *
 * # Heading one
 *
 * ## Heading two
 *
 * ### Heading three
 *
 * Unordered list:
 * - A
 * - B
 *
 * Ordered list:
 * 1. foo
 * 2. bar
 *
 * ---
 *
 * [title](https://www.markdownguide.org/cheat-sheet/)
 */
class CommentsMarkdown : NativeBase {



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

