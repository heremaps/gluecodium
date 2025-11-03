/*

 *
 */

@file:JvmName("StructsExtensions")

package com.example.smoke

import com.example.NativeBase

class Structs : NativeBase {

    enum class FooBar(@JvmField val value: Int) {
        FOO(0),
        BAR(1);
    }
    class Point {
        @JvmField var x: Double
        @JvmField var y: Double


        /**
         * This is some constructor, which constructs Point from polar coordinates.
         * @param phi
         * @param r
         */


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
        @JvmField var a: Structs.Point
        @JvmField var b: Structs.Point



        constructor(a: Structs.Point, b: Structs.Point) {
            this.a = a
            this.b = b
        }





    }

    class AllTypesStruct {
        @JvmField val int8Field: Byte
        @JvmField val uint8Field: Short
        @JvmField val int16Field: Short
        @JvmField val uint16Field: Int
        @JvmField val int32Field: Int
        @JvmField val uint32Field: Long
        @JvmField val int64Field: Long
        @JvmField val uint64Field: Long
        @JvmField val floatField: Float
        @JvmField val doubleField: Double
        @JvmField val stringField: String
        @JvmField val booleanField: Boolean
        @JvmField val bytesField: ByteArray
        @JvmField val pointField: Structs.Point



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
        @JvmField var structField: Structs.AllTypesStruct



        constructor(structField: Structs.AllTypesStruct) {
            this.structField = structField
        }





    }

    class DoubleNestingImmutableStruct {
        @JvmField var nestingStructField: Structs.NestingImmutableStruct



        constructor(nestingStructField: Structs.NestingImmutableStruct) {
            this.nestingStructField = nestingStructField
        }





    }

    class StructWithArrayOfImmutable {
        @JvmField var arrayField: List<@JvmSuppressWildcards Structs.AllTypesStruct>



        constructor(arrayField: List<@JvmSuppressWildcards Structs.AllTypesStruct>) {
            this.arrayField = arrayField
        }





    }

    class ImmutableStructWithCppAccessors {
        @JvmField val trivialIntField: Int
        @JvmField val trivialDoubleField: Double
        @JvmField val nontrivialStringField: String
        @JvmField val nontrivialPointField: Structs.Point
        @JvmField val nontrivialOptionalPoint: Structs.Point?



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
        @JvmField var trivialIntField: Int
        @JvmField var trivialDoubleField: Double
        @JvmField var nontrivialStringField: String
        @JvmField var nontrivialPointField: Structs.Point
        @JvmField var nontrivialOptionalPoint: Structs.Point?



        constructor(trivialIntField: Int, trivialDoubleField: Double, nontrivialStringField: String, nontrivialPointField: Structs.Point) {
            this.trivialIntField = trivialIntField
            this.trivialDoubleField = trivialDoubleField
            this.nontrivialStringField = nontrivialStringField
            this.nontrivialPointField = nontrivialPointField
            this.nontrivialOptionalPoint = null
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


        @JvmStatic external fun swapPointCoordinates(input: Structs.Point) : Structs.Point


        @JvmStatic external fun returnAllTypesStruct(input: Structs.AllTypesStruct) : Structs.AllTypesStruct


        @JvmStatic external fun createPoint(x: Double, y: Double) : TypeCollection.Point


        @JvmStatic external fun modifyAllTypesStruct(input: TypeCollection.AllTypesStruct) : TypeCollection.AllTypesStruct
    }
}


