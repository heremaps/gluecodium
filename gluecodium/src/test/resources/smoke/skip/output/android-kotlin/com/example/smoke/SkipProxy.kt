/*

 *
 */

@file:JvmName("SkipProxy")

package com.example.smoke


interface SkipProxy {

    fun notInJava(input: String) : String
    fun notInSwift(input: Boolean) : Boolean
    fun notInDart(input: Float) : Float

    var skippedInJava: String
        get
        set

    var isSkippedInSwift: Boolean
        get
        set

    var skippedInDart: Float
        get
        set


}

