/*

 *
 */

@file:JvmName("MutableStructNoClashExtensions")

package com.example.smoke


class MutableStructNoClash {
    @JvmField var stringField: String
    @JvmField var intField: Int
    @JvmField var boolField: Boolean





    constructor() {
        this.stringField = "nonsense"
        this.intField = 42
        this.boolField = true
    }





}

