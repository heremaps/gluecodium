/*

 *
 */

@file:JvmName("FieldConstructorsAllDefaultsExtensions")

package com.example.smoke


class FieldConstructorsAllDefaults {
    @JvmField var stringField: String
    @JvmField var intField: Int
    @JvmField var boolField: Boolean





    constructor() {
        this.stringField = "nonsense"
        this.intField = 42
        this.boolField = true
    }


    constructor(intField: Int) {
        this.intField = intField
        this.stringField = "nonsense"
        this.boolField = true
    }


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

