/*

 *
 */

@file:JvmName("UseKotlinExternalConst")

package com.example.kotlinsmoke


class UseKotlinExternalConst {
    @JvmField var stringField: String



    constructor(stringField: String) {
        this.stringField = stringField
    }





    companion object {
        val DEFAULT_TRUTH: kotlin.Boolean? = true
    }
}

