/*

 *
 */

@file:JvmName("FieldConstructorsPartialDefaults")

package com.example.smoke


class FieldConstructorsPartialDefaults {
    @JvmField var stringField: String
    @JvmField var intField: Int
    @JvmField var boolField: Boolean




    /**
     * This is some field constructor with two parameters.
     * It is very important.
     * @param intField 
     * @param stringField 
     */
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

