/*

 *
 */

@file:JvmName("ImmutableStructNoClashExtensions")

package com.example.smoke


class ImmutableStructNoClash {
    @JvmField val stringField: String
    @JvmField val intField: Int
    @JvmField val boolField: Boolean



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

