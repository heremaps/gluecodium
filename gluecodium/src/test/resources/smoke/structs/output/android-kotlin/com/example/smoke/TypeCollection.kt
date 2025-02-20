/*

 *
 */

package com.example.smoke


class TypeCollection {

    class Point {
        var x: Double
        var y: Double



        constructor(x: Double, y: Double) {
            this.x = x
            this.y = y
        }


    }

    class Line {
        var a: TypeCollection.Point
        var b: TypeCollection.Point



        constructor(a: TypeCollection.Point, b: TypeCollection.Point) {
            this.a = a
            this.b = b
        }


    }

    class AllTypesStruct {
        var int8Field: Byte
        var uint8Field: Short
        var int16Field: Short
        var uint16Field: Int
        var int32Field: Int
        var uint32Field: Long
        var int64Field: Long
        var uint64Field: Long
        var floatField: Float
        var doubleField: Double
        var stringField: String
        var booleanField: Boolean
        var bytesField: ByteArray
        var pointField: TypeCollection.Point



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

