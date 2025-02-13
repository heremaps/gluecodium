/*

 *
 */

package com.example.smoke


class ImmutableStructNoClash {
    val stringField: String
    val intField: Int
    val boolField: Boolean



    constructor(stringField: String, intField: Int, boolField: Boolean) {
        this.stringField = stringField
        this.intField = intField
        this.boolField = boolField
    }
    constructor() {
        this.stringField = "nonsense"
        this.intField = 42
        this.boolField = true
    }


}

