/*

 *
 */

@file:JvmName("LambdaComments")

package com.example.smoke

import com.example.NativeBase

class LambdaComments : NativeBase {

    fun interface WithNoNamedParameters {
        fun apply(p0: String) : String
    }

    fun interface WithNoDocsForParameters {
        fun apply(p0: String) : String
    }

    fun interface WithNamedParameters {
        fun apply(inputParameter: String) : String
    }

    fun interface MixedDocNameParameters {
        fun apply(inputParameter: String, secondInputParameter: String) : String
    }

    fun interface NoCommentsNoNamedParams {
        fun apply(p0: String, p1: String) : String
    }

    fun interface NoCommentsWithNamedParams {
        fun apply(first: String, second: String) : String
    }

    class WithNoNamedParametersImpl : NativeBase, WithNoNamedParameters {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class WithNoDocsForParametersImpl : NativeBase, WithNoDocsForParameters {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class WithNamedParametersImpl : NativeBase, WithNamedParameters {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(inputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class MixedDocNameParametersImpl : NativeBase, MixedDocNameParameters {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(inputParameter: String, secondInputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class NoCommentsNoNamedParamsImpl : NativeBase, NoCommentsNoNamedParams {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String, p1: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class NoCommentsWithNamedParamsImpl : NativeBase, NoCommentsWithNamedParams {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
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
