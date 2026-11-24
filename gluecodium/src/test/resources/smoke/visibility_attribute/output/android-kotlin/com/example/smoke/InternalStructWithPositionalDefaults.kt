/*

 *
 */

@file:JvmName("InternalStructWithPositionalDefaultsExtensions")


package com.example.smoke


internal class InternalStructWithPositionalDefaults {
    @JvmField @JvmSynthetic internal var value: Int
    @JvmField @JvmSynthetic internal var name: String



    private constructor(value: Int, name: String = "default") {
        this.value = value
        this.name = name
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(value: Int, name: String = "default"): InternalStructWithPositionalDefaults = InternalStructWithPositionalDefaults(value, name)
    }
}

