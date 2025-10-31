/*

 *
 */

@file:JvmName("NullableExtensions")

package com.example.smoke

import com.example.NativeBase

class Nullable : NativeBase {

    enum class SomeEnum(@JvmField val value: Int) {
        ON(0),
        OFF(1);
    }
    class SomeStruct {
        @JvmField var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }





    }

    class NullableStruct {
        @JvmField var stringField: String?
        @JvmField var boolField: Boolean?
        @JvmField var doubleField: Double?
        @JvmField var structField: Nullable.SomeStruct?
        @JvmField var enumField: Nullable.SomeEnum?
        @JvmField var arrayField: List<@JvmSuppressWildcards String>?
        @JvmField var inlineArrayField: List<@JvmSuppressWildcards String>?
        @JvmField var mapField: Map<@JvmSuppressWildcards Long, @JvmSuppressWildcards String>?
        @JvmField var instanceField: SomeInterface?



        constructor() {
            this.stringField = null
            this.boolField = null
            this.doubleField = null
            this.structField = null
            this.enumField = null
            this.arrayField = null
            this.inlineArrayField = null
            this.mapField = null
            this.instanceField = null
        }





    }

    class NullableIntsStruct {
        @JvmField var int8Field: Byte?
        @JvmField var int16Field: Short?
        @JvmField var int32Field: Int?
        @JvmField var int64Field: Long?
        @JvmField var uint8Field: Short?
        @JvmField var uint16Field: Int?
        @JvmField var uint32Field: Long?
        @JvmField var uint64Field: Long?



        constructor() {
            this.int8Field = null
            this.int16Field = null
            this.int32Field = null
            this.int64Field = null
            this.uint8Field = null
            this.uint16Field = null
            this.uint32Field = null
            this.uint64Field = null
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





    external fun methodWithString(input: String?) : String?


    external fun methodWithBoolean(input: Boolean?) : Boolean?


    external fun methodWithDouble(input: Double?) : Double?


    external fun methodWithInt(input: Long?) : Long?


    external fun methodWithSomeStruct(input: Nullable.SomeStruct?) : Nullable.SomeStruct?


    external fun methodWithSomeEnum(input: Nullable.SomeEnum?) : Nullable.SomeEnum?


    external fun methodWithSomeArray(input: List<@JvmSuppressWildcards String>?) : List<@JvmSuppressWildcards String>?


    external fun methodWithInlineArray(input: List<@JvmSuppressWildcards String>?) : List<@JvmSuppressWildcards String>?


    external fun methodWithSomeMap(input: Map<@JvmSuppressWildcards Long, @JvmSuppressWildcards String>?) : Map<@JvmSuppressWildcards Long, @JvmSuppressWildcards String>?


    external fun methodWithInstance(input: SomeInterface?) : SomeInterface?

    var stringProperty: String?
        external get
        external set

    var isBoolProperty: Boolean?
        external get
        external set

    var doubleProperty: Double?
        external get
        external set

    var intProperty: Long?
        external get
        external set

    var structProperty: Nullable.SomeStruct?
        external get
        external set

    var enumProperty: Nullable.SomeEnum?
        external get
        external set

    var arrayProperty: List<@JvmSuppressWildcards String>?
        external get
        external set

    var inlineArrayProperty: List<@JvmSuppressWildcards String>?
        external get
        external set

    var mapProperty: Map<@JvmSuppressWildcards Long, @JvmSuppressWildcards String>?
        external get
        external set

    var instanceProperty: SomeInterface?
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


