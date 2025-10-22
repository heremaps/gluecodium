/*

 *
 */

@file:JvmName("StructWithKotlinPositionalDefaultsExtensions")

package com.example.smoke


/**
 * This is an important struct that uses positional default annotation.
 */
class StructWithKotlinPositionalDefaults {
    @JvmField var firstInitField: Int
    @JvmField var firstFreeField: String
    @JvmField var secondInitField: Float
    @JvmField var secondFreeField: Boolean
    @JvmField var thirdInitField: String



    /**
     * This is a comment that should be rendered for all struct constructors
     * including positional default one.
     * @param firstFreeField 
     * @param secondFreeField 
     * @param firstInitField 
     * @param secondInitField 
     * @param thirdInitField 
     */
    @JvmOverloads
    constructor(firstFreeField: String, secondFreeField: Boolean, firstInitField: Int = 42, secondInitField: Float = 7.2f, thirdInitField: String = "\\Jonny \"Magic\" Smith\n") {
        this.firstInitField = firstInitField
        this.firstFreeField = firstFreeField
        this.secondInitField = secondInitField
        this.secondFreeField = secondFreeField
        this.thirdInitField = thirdInitField
    }





}

