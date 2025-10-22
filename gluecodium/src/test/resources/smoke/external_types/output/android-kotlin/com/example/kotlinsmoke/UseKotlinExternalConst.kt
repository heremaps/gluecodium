/*

 *
 */

@file:JvmName("UseKotlinExternalConstExtensions")

package com.example.kotlinsmoke


class UseKotlinExternalConst {
    @JvmField var stringField: String



    constructor(stringField: String) {
        this.stringField = stringField
    }





    companion object {
        @JvmField final val DEFAULT_TRUTH: kotlin.Boolean? = true
    }
}

