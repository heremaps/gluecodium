/*

 *
 */

@file:JvmName("ImmutableStructWithClashExtensions")

package com.example.smoke


class ImmutableStructWithClash {
    @JvmField val stringField: String
    @JvmField val intField: Int
    @JvmField val boolField: Boolean





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

