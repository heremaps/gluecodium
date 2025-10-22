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

    fun interface Consumer {


        fun apply(p0: String) : Unit
    }

    fun interface Indexer {


        fun apply(p0: String, idx: Float) : Int
    }

    fun interface NullableConfuser {


        fun apply(p0: String?) : Lambdas.Producer?
    }

    /**
     * @suppress
     */
    class ProducerImpl : NativeBase, Producer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply() : String



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class ConfounderImpl : NativeBase, Confounder {
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
    /**
     * @suppress
     */
    class ConsumerImpl : NativeBase, Consumer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class IndexerImpl : NativeBase, Indexer {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String, idx: Float) : Int



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class NullableConfuserImpl : NativeBase, NullableConfuser {
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


        @JvmStatic external fun fuse(items: MutableList<String>, callback: Lambdas.Indexer) : MutableMap<Int, String>
    }
}

