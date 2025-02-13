/*

 *
 */

package com.example.smoke


class ImmutableStructWithClash {
    val stringField: String
    val intField: Int
    val boolField: Boolean



    constructor() {
        this.stringField = "nonsense"
        this.intField = 42
        this.boolField = true
    }
    constructor(boolField: Boolean, intField: Int, stringField: String) {
        this.boolField = boolField
        this.intField = intField
        this.stringField = stringField
    }


}

