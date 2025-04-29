/*

 *
 */

@file:JvmName("TypeCollection")

package com.example.smoke


class TypeCollection {

    class Point {
        @JvmField var x: Double
        @JvmField var y: Double



        constructor(x: Double, y: Double) {
            this.x = x
            this.y = y
        }





    }

    class Line {
        @JvmField var a: TypeCollection.Point
        @JvmField var b: TypeCollection.Point



        constructor(a: TypeCollection.Point, b: TypeCollection.Point) {
            this.a = a
            this.b = b
        }





    }

    class AllTypesStruct {
        @JvmField var int8Field: Byte
        @JvmField var uint8Field: Short
        @JvmField var int16Field: Short
        @JvmField var uint16Field: Int
        @JvmField var int32Field: Int
        @JvmField var uint32Field: Long
        @JvmField var int64Field: Long
        @JvmField var uint64Field: Long
        @JvmField var floatField: Float
        @JvmField var doubleField: Double
        @JvmField var stringField: String
        @JvmField var booleanField: Boolean
        @JvmField var bytesField: ByteArray
        @JvmField var pointField: TypeCollection.Point



        constructor(int8Field: Byte, uint8Field: Short, int16Field: Short, uint16Field: Int, int32Field: Int, uint32Field: Long, int64Field: Long, uint64Field: Long, floatField: Float, doubleField: Double, stringField: String, booleanField: Boolean, bytesField: ByteArray, pointField: TypeCollection.Point) {
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








}

