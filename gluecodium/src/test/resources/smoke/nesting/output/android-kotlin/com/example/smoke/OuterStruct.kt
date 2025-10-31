/*

 *
 */

@file:JvmName("OuterStructExtensions")

package com.example.smoke

import com.example.NativeBase
import java.util.Date
import java.util.Locale

class OuterStruct {
    @JvmField var field: String

    enum class InnerEnum(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
    }
    class InstantiationException(@JvmField val error: OuterStruct.InnerEnum) : Exception(error.toString())


    class InnerStruct {
        @JvmField var otherField: List<@JvmSuppressWildcards Date>



        constructor(otherField: List<@JvmSuppressWildcards Date>) {
            this.otherField = otherField
        }





        external fun doSomething() : Unit


    }

    class InnerClass : NativeBase {



        /**
         * For internal use only.
         * @suppress
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}





        external fun fooBar() : Set<@JvmSuppressWildcards Locale>




        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }


    class Builder : NativeBase {




        constructor() : this(create(), null as Any?) {
            cacheThisInstance();
        }

        /**
         * For internal use only.
         * @suppress
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        private external fun cacheThisInstance()




        external fun field(value: String) : OuterStruct.Builder


        external fun build() : OuterStruct




        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

            @JvmStatic external fun create() : Long
        }
    }


    fun interface InnerInterface {



        fun barBaz() : Map<@JvmSuppressWildcards String, @JvmSuppressWildcards ByteArray>


    }

    fun interface InnerLambda {


        fun apply() : Unit
    }

    /**
     * @suppress
     */
    class InnerInterfaceImpl : NativeBase, InnerInterface {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun barBaz() : Map<@JvmSuppressWildcards String, @JvmSuppressWildcards ByteArray>



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    /**
     * @suppress
     */
    class InnerLambdaImpl : NativeBase, InnerLambda {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply() : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }


    constructor(field: String) {
        this.field = field
    }




    @Throws(OuterStruct.InstantiationException::class)
    external fun doNothing() : Unit


}

