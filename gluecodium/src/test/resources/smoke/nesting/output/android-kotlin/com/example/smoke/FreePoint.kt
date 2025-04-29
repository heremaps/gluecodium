/*

 *
 */

@file:JvmName("FreePoint")

package com.example.smoke


class FreePoint {
    @JvmField var x: Double
    @JvmField var y: Double



    constructor(x: Double, y: Double) {
        this.x = x
        this.y = y
    }



    external fun flip() : FreePoint


    companion object {
        val A_BAR: FreeEnum = FreeEnum.BAR
    }
}

