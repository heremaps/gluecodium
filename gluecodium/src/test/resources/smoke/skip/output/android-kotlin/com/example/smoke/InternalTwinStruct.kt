/*

 *
 */

@file:JvmName("InternalTwinStructExtensions")


package com.example.smoke


internal class InternalTwinStruct {
    @JvmField @JvmSynthetic internal var distance: Int



    private constructor(distance: Int) {
        this.distance = distance
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(distance: Int): InternalTwinStruct = InternalTwinStruct(distance)
    }
}

