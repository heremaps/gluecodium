/*

 *
 */

package com.example.smoke

import com.example.NativeBase
import java.util.Date
import java.util.Locale

class OuterStruct {
    var field: String

    enum class InnerEnum(private val value: Int) {
        FOO(0),
        BAR(1);
    }
    class InstantiationException(val error: OuterStruct.InnerEnum) : Exception(error.toString())


    class InnerStruct {
        var otherField: MutableList<Date>



        constructor(otherField: MutableList<Date>) {
            this.otherField = otherField
        }



        external fun doSomething() : Unit

    }

    class InnerClass : NativeBase {



        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        external fun fooBar() : MutableSet<Locale>



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class Builder : NativeBase {


        constructor() : this(create(), null as Any?) {
            cacheThisInstance();
        }

        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        private external fun cacheThisInstance()


        external fun field(value: String) : OuterStruct.Builder
        external fun build() : OuterStruct



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
            @JvmStatic external fun create() : Long
        }
    }
    interface InnerInterface {

        fun barBaz() : MutableMap<String, ByteArray>


    }

    fun interface InnerLambda {
        fun apply() : Unit
    }

    class InnerInterfaceImpl : NativeBase, InnerInterface {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun barBaz() : MutableMap<String, ByteArray>



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }
    class InnerLambdaImpl : NativeBase, InnerLambda {
        /*
         * For internal use only.
         * @hidden
         * @param nativeHandle The handle to resources on C++ side.
         * @param tag Tag used by callers to avoid overload resolution problems.
         */
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply() : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        }
    }


    constructor(field: String) {
        this.field = field
    }



    external fun doNothing() : Unit

}

