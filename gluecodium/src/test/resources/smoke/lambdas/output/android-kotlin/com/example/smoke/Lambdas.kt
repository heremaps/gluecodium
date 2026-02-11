/*

 *
 */

@file:JvmName("LambdasExtensions")


package com.example.smoke

import com.example.NativeBase

class Lambdas : NativeBase {

    fun interface Producer {


        fun apply() : String
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class ProducerImpl : NativeBase, Producer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply() : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * Should confuse everyone thoroughly
     */
    fun interface Confounder {
        /**
         * Should confuse everyone thoroughly
         * @param p0
         * @return
         */

        fun confuse(p0: String) : Lambdas.Producer
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class ConfounderImpl : NativeBase, Confounder {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        /**
         * Should confuse everyone thoroughly
         * @param p0
         * @return
         */

        override external fun confuse(p0: String) : Lambdas.Producer



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    fun interface Consumer {


        fun apply(p0: String) : Unit
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class ConsumerImpl : NativeBase, Consumer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    fun interface Indexer {


        fun apply(p0: String, idx: Float) : Int
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class IndexerImpl : NativeBase, Indexer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String, idx: Float) : Int



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    fun interface NullableConfuser {


        fun apply(p0: String?) : Lambdas.Producer?
    }

    /**
     * @suppress
     *
     * This class is used to represent C++ implementations of the interface or lambda in Kotlin.
     * It is instantiated by JNI and should not be used by the end users.
     */
    private class NullableConfuserImpl : NativeBase, NullableConfuser {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String?) : Lambdas.Producer?



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





    external fun deconfuse(value: String, confuser: Lambdas.Confounder) : Lambdas.Producer




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)


        @JvmStatic external fun fuse(items: List<String>, callback: Lambdas.Indexer) : Map<Int, String>
    }
}


