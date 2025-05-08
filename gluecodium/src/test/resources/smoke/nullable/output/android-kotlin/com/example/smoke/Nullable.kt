/*

 *
 */

@file:JvmName("Nullable")

package com.example.smoke

import com.example.NativeBase

class Nullable : NativeBase {

    enum class SomeEnum(private val value: Int) {
        ON(0),
        OFF(1);
    }
    class SomeStruct {
        var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }





    }

    class NullableStruct {
        var stringField: String?
        var boolField: Boolean?
        var doubleField: Double?
        var structField: Nullable.SomeStruct?
        var enumField: Nullable.SomeEnum?
        var arrayField: MutableList<String>?
        var inlineArrayField: MutableList<String>?
        var mapField: MutableMap<Long, String>?
        var instanceField: SomeInterface?



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
        var int8Field: Byte?
        var int16Field: Short?
        var int32Field: Int?
        var int64Field: Long?
        var uint8Field: Short?
        var uint16Field: Int?
        var uint32Field: Long?
        var uint64Field: Long?



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



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}



    external fun methodWithString(input: String?) : String?
    external fun methodWithBoolean(input: Boolean?) : Boolean?
    external fun methodWithDouble(input: Double?) : Double?
    external fun methodWithInt(input: Long?) : Long?
    external fun methodWithSomeStruct(input: Nullable.SomeStruct?) : Nullable.SomeStruct?
    external fun methodWithSomeEnum(input: Nullable.SomeEnum?) : Nullable.SomeEnum?
    external fun methodWithSomeArray(input: MutableList<String>?) : MutableList<String>?
    external fun methodWithInlineArray(input: MutableList<String>?) : MutableList<String>?
    external fun methodWithSomeMap(input: MutableMap<Long, String>?) : MutableMap<Long, String>?
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

    var arrayProperty: MutableList<String>?
        external get
        external set

    var inlineArrayProperty: MutableList<String>?
        external get
        external set

    var mapProperty: MutableMap<Long, String>?
        external get
        external set

    var instanceProperty: SomeInterface?
        external get
        external set




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
