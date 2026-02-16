/*

 *
 */

@file:JvmName("LambdaCommentsExtensions")


package com.example.smoke

import com.example.NativeBase

class LambdaComments : NativeBase {

    /**
     * The first line of the doc.
     */
    fun interface WithNoNamedParameters {
        /**
         * The first line of the doc.
         * @param p0 The first input parameter
         * @return
         */

        fun apply(p0: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class WithNoNamedParametersImpl : NativeBase, WithNoNamedParameters {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * The first line of the doc.
         * @param p0 The first input parameter
         * @return
         */

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * The first line of the doc.
     */
    fun interface WithNoDocsForParameters {
        /**
         * The first line of the doc.
         * @param p0
         * @return
         */

        fun apply(p0: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class WithNoDocsForParametersImpl : NativeBase, WithNoDocsForParameters {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * The first line of the doc.
         * @param p0
         * @return
         */

        override external fun apply(p0: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * The first line of the doc.
     */
    fun interface WithNamedParameters {
        /**
         * The first line of the doc.
         * @param inputParameter The first input parameter. The second sentence of the first input parameter.
         * @return The string.
         */

        fun apply(inputParameter: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class WithNamedParametersImpl : NativeBase, WithNamedParameters {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * The first line of the doc.
         * @param inputParameter The first input parameter. The second sentence of the first input parameter.
         * @return The string.
         */

        override external fun apply(inputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * The first line of the doc.
     */
    fun interface MixedDocNameParameters {
        /**
         * The first line of the doc.
         * @param inputParameter
         * @param secondInputParameter
         * @return The string.
         */

        fun apply(inputParameter: String, secondInputParameter: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class MixedDocNameParametersImpl : NativeBase, MixedDocNameParameters {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * The first line of the doc.
         * @param inputParameter
         * @param secondInputParameter
         * @return The string.
         */

        override external fun apply(inputParameter: String, secondInputParameter: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    fun interface NoCommentsNoNamedParams {


        fun apply(p0: String, p1: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class NoCommentsNoNamedParamsImpl : NativeBase, NoCommentsNoNamedParams {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String, p1: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    fun interface NoCommentsWithNamedParams {


        fun apply(first: String, second: String) : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class NoCommentsWithNamedParamsImpl : NativeBase, NoCommentsWithNamedParams {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(first: String, second: String) : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


