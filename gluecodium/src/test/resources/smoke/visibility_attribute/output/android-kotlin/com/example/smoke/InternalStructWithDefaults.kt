/*

 *
 */

@file:JvmName("InternalStructWithDefaultsExtensions")


package com.example.smoke


/**
 * Internal constructors are private in Kotlin and are created through synthetic factories.
 */
internal class InternalStructWithDefaults {
    @JvmField @JvmSynthetic internal var value: Int
    @JvmField @JvmSynthetic internal var name: String



    private constructor(value: Int) {
        this.value = value
        this.name = "default"
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(value: Int): InternalStructWithDefaults = InternalStructWithDefaults(value)
    }
}

