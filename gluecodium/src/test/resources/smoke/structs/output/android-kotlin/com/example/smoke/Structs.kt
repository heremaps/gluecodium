/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class Structs : NativeBase {

    enum class FooBar(private val value: Int) {
        FOO(0),
        BAR(1);
    }
    class Point {
        var x: Double
        var y: Double


        constructor(phi: Double, r: Double) {
            val _other = fromPolar(phi, r)
            this.x = _other.x
            this.y = _other.y
        }





        companion object {
            @JvmStatic external fun fromPolar(phi: Double, r: Double) : Point
        }
    }

    class Line {
        var a: Structs.Point
        var b: Structs.Point



        constructor(a: Structs.Point, b: Structs.Point) {
            this.a = a
            this.b = b
        }




    }

    class AllTypesStruct {
        val int8Field: Byte
        val uint8Field: Short
        val int16Field: Short
        val uint16Field: Int
        val int32Field: Int
        val uint32Field: Long
        val int64Field: Long
        val uint64Field: Long
        val floatField: Float
        val doubleField: Double
        val stringField: String
        val booleanField: Boolean
        val bytesField: ByteArray
        val pointField: Structs.Point



        constructor(int8Field: Byte, uint8Field: Short, int16Field: Short, uint16Field: Int, int32Field: Int, uint32Field: Long, int64Field: Long, uint64Field: Long, floatField: Float, doubleField: Double, stringField: String, booleanField: Boolean, bytesField: ByteArray, pointField: Structs.Point) {
            this.int8Field = int8Field
            this.uint8Field = uint8Field
            this.int16Field = int16Field
            this.uint16Field = uint16Field
            this.int32Field = int32Field
            this.uint32Field = uint32Field
            this.int64Field = int64Field
            this.uint64Field = uint64Field
            this.floatField = floatField
            this.doubleField = doubleField
            this.stringField = stringField
            this.booleanField = booleanField
            this.bytesField = bytesField
            this.pointField = pointField
        }




    }

    class NestingImmutableStruct {
        var structField: Structs.AllTypesStruct



        constructor(structField: Structs.AllTypesStruct) {
            this.structField = structField
        }




    }

    class DoubleNestingImmutableStruct {
        var nestingStructField: Structs.NestingImmutableStruct



        constructor(nestingStructField: Structs.NestingImmutableStruct) {
            this.nestingStructField = nestingStructField
        }




    }

    class StructWithArrayOfImmutable {
        var arrayField: MutableList<Structs.AllTypesStruct>



        constructor(arrayField: MutableList<Structs.AllTypesStruct>) {
            this.arrayField = arrayField
        }




    }

    class ImmutableStructWithCppAccessors {
        val trivialIntField: Int
        val trivialDoubleField: Double
        val nontrivialStringField: String
        val nontrivialPointField: Structs.Point
        val nontrivialOptionalPoint: Structs.Point?



        constructor(trivialIntField: Int, trivialDoubleField: Double, nontrivialStringField: String, nontrivialPointField: Structs.Point) {
            this.trivialIntField = trivialIntField
            this.trivialDoubleField = trivialDoubleField
            this.nontrivialStringField = nontrivialStringField
            this.nontrivialPointField = nontrivialPointField
            this.nontrivialOptionalPoint = null
        }
        constructor(trivialIntField: Int, trivialDoubleField: Double, nontrivialStringField: String, nontrivialPointField: Structs.Point, nontrivialOptionalPoint: Structs.Point?) {
            this.trivialIntField = trivialIntField
            this.trivialDoubleField = trivialDoubleField
            this.nontrivialStringField = nontrivialStringField
            this.nontrivialPointField = nontrivialPointField
            this.nontrivialOptionalPoint = nontrivialOptionalPoint
        }




    }

    class MutableStructWithCppAccessors {
        var trivialIntField: Int
        var trivialDoubleField: Double
        var nontrivialStringField: String
        var nontrivialPointField: Structs.Point
        var nontrivialOptionalPoint: Structs.Point?



        constructor(trivialIntField: Int, trivialDoubleField: Double, nontrivialStringField: String, nontrivialPointField: Structs.Point) {
            this.trivialIntField = trivialIntField
            this.trivialDoubleField = trivialDoubleField
            this.nontrivialStringField = nontrivialStringField
            this.nontrivialPointField = nontrivialPointField
            this.nontrivialOptionalPoint = null
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
        @JvmStatic external fun swapPointCoordinates(input: Structs.Point) : Structs.Point
        @JvmStatic external fun returnAllTypesStruct(input: Structs.AllTypesStruct) : Structs.AllTypesStruct
        @JvmStatic external fun createPoint(x: Double, y: Double) : TypeCollection.Point
        @JvmStatic external fun modifyAllTypesStruct(input: TypeCollection.AllTypesStruct) : TypeCollection.AllTypesStruct
    }
}
