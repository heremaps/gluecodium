/*

 *
 */

@file:JvmName("FieldCustomConstructorsMixExtensions")

package com.example.smoke


class FieldCustomConstructorsMix {
    @JvmField var stringField: String
    @JvmField var intField: Int
    @JvmField var boolField: Boolean





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

