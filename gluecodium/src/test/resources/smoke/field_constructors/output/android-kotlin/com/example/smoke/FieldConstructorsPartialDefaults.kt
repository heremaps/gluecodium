/*

 *
 */

@file:JvmName("FieldConstructorsPartialDefaults")

package com.example.smoke


class FieldConstructorsPartialDefaults {
    var stringField: String
    var intField: Int
    var boolField: Boolean




    constructor(intField: Int, stringField: String) {
        this.intField = intField
        this.stringField = stringField
        this.boolField = true
    }

    constructor(boolField: Boolean, intField: Int, stringField: String) {
        this.boolField = boolField
        this.intField = intField
        this.stringField = stringField
    }





}

