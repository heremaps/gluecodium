/*

 *
 */

@file:JvmName("TypeCollection")

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

    class StructHavingAliasFieldDefinedBelow {
        var field: Long



        constructor(field: Long) {
            this.field = field
        }





    }








    companion object {
        val INVALID_STORAGE_ID: Long = 0L
    }
}

