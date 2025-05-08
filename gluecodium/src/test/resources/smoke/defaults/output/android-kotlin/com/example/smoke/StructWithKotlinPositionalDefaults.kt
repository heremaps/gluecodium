/*

 *
 */

@file:JvmName("StructWithKotlinPositionalDefaults")

package com.example.smoke


class StructWithKotlinPositionalDefaults {
    var firstInitField: Int
    var firstFreeField: String
    var secondInitField: Float
    var secondFreeField: Boolean
    var thirdInitField: String



    @JvmOverloads
    constructor(firstFreeField: String, secondFreeField: Boolean, firstInitField: Int = 42, secondInitField: Float = 7.2f, thirdInitField: String = "\\Jonny \"Magic\" Smith\n") {
        this.firstInitField = firstInitField
        this.firstFreeField = firstFreeField
        this.secondInitField = secondInitField
        this.secondFreeField = secondFreeField
        this.thirdInitField = thirdInitField
    }





}

