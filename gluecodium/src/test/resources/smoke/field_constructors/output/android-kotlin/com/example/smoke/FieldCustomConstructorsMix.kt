/*

 *
 */

@file:JvmName("FieldCustomConstructorsMix")

package com.example.smoke


class FieldCustomConstructorsMix {
    var stringField: String
    var intField: Int
    var boolField: Boolean



    constructor(intValue: Int, dummy: Double) {
        val _other = createMe(intValue, dummy)
        this.stringField = _other.stringField
        this.intField = _other.intField
        this.boolField = _other.boolField
    }


    constructor(intField: Int) {
        this.intField = intField
        this.stringField = "nonsense"
        this.boolField = true
    }





    companion object {
        @JvmStatic external fun createMe(intValue: Int, dummy: Double) : FieldCustomConstructorsMix
    }
}

