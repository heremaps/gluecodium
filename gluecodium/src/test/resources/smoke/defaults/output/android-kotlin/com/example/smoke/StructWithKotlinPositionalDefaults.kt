/*

 *
 */

@file:JvmName("StructWithKotlinPositionalDefaults")

package com.example.smoke


class StructWithKotlinPositionalDefaults {
    @JvmField var firstInitField: Int
    @JvmField var firstFreeField: String
    @JvmField var secondInitField: Float
    @JvmField var secondFreeField: Boolean
    @JvmField var thirdInitField: String



    @JvmOverloads
    constructor(firstFreeField: String, secondFreeField: Boolean, firstInitField: Int = 42, secondInitField: Float = 7.2f, thirdInitField: String = "\\Jonny \"Magic\" Smith\n") {
        this.firstInitField = firstInitField
        this.firstFreeField = firstFreeField
        this.secondInitField = secondInitField
        this.secondFreeField = secondFreeField
        this.thirdInitField = thirdInitField
    }





}

