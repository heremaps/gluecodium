/*

 *
 */

@file:JvmName("LambdaComments")

package com.example.smoke

import com.example.NativeBase

class LambdaComments : NativeBase {

    /**
     * The first line of the doc.
     */
    fun interface WithNoNamedParameters {
        fun apply(p0: String) : String
    }

    /**
     * The first line of the doc.
     */
    fun interface WithNoDocsForParameters {
        fun apply(p0: String) : String
    }

    /**
     * The first line of the doc.
     */
    fun interface WithNamedParameters {
        fun apply(inputParameter: String) : String
    }

    /**
     * The first line of the doc.
     */
    fun interface MixedDocNameParameters {
        fun apply(inputParameter: String, secondInputParameter: String) : String
    }

    fun interface NoCommentsNoNamedParams {
        fun apply(p0: String, p1: String) : String
    }

    fun interface NoCommentsWithNamedParams {
        fun apply(first: String, second: String) : String
    }

    /**
     * @suppress
     */
    class WithNoNamedParametersImpl : NativeBase, WithNoNamedParameters {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class WithNoDocsForParametersImpl : NativeBase, WithNoDocsForParameters {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class WithNamedParametersImpl : NativeBase, WithNamedParameters {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(inputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class MixedDocNameParametersImpl : NativeBase, MixedDocNameParameters {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(inputParameter: String, secondInputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class NoCommentsNoNamedParamsImpl : NativeBase, NoCommentsNoNamedParams {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String, p1: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class NoCommentsWithNamedParamsImpl : NativeBase, NoCommentsWithNamedParams {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(first: String, second: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
