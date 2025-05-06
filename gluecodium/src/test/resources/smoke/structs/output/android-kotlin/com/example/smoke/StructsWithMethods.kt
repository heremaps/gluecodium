/*

 *
 */

package com.example.smoke


class StructsWithMethods {

    class Vector {
        var x: Double
        var y: Double


        constructor(x: Double, y: Double) {
            val _other = create(x, y)
            this.x = _other.x
            this.y = _other.y
        }
    @Throws (ValidationUtils.ValidationException::class)
        constructor(other: StructsWithMethods.Vector) {
            val _other = create(other)
            this.x = _other.x
            this.y = _other.y
        }




        external fun distanceTo(other: StructsWithMethods.Vector) : Double
        external fun add(other: StructsWithMethods.Vector) : StructsWithMethods.Vector


        companion object {
            @JvmStatic external fun validate(x: Double, y: Double) : Boolean
            @JvmStatic external fun create(x: Double, y: Double) : Vector
            @Throws (ValidationUtils.ValidationException::class) @JvmStatic external fun create(other: StructsWithMethods.Vector) : Vector
        }
    }








}

