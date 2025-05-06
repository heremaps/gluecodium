/*

 *
 */

@file:JvmName("MutableStructNoClash")

package com.example.smoke


class MutableStructNoClash {
    var stringField: String
    var intField: Int
    var boolField: Boolean




    constructor() {
        this.stringField = "nonsense"
        this.intField = 42
        this.boolField = true
    }





}

