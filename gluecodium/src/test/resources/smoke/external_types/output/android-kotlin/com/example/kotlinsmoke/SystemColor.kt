/*

 *
 */

@file:JvmName("SystemColorExtensions")


package com.example.kotlinsmoke


internal class SystemColor {
    @JvmField @JvmSynthetic internal var red: Float
    @JvmField @JvmSynthetic internal var green: Float
    @JvmField @JvmSynthetic internal var blue: Float
    @JvmField @JvmSynthetic internal var alpha: Float



    private constructor(red: Float, green: Float, blue: Float, alpha: Float) {
        this.red = red
        this.green = green
        this.blue = blue
        this.alpha = alpha
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(red: Float, green: Float, blue: Float, alpha: Float): SystemColor = SystemColor(red, green, blue, alpha)
    }
}

