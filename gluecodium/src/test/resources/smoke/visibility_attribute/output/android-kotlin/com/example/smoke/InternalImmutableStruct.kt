/*

 *
 */

@file:JvmName("InternalImmutableStructExtensions")


package com.example.smoke


internal class InternalImmutableStruct {
    @JvmField @JvmSynthetic internal val value: Int
    @JvmField @JvmSynthetic internal val name: String



    private constructor(value: Int) {
        this.value = value
        this.name = "default"
    }
    private constructor(value: Int, name: String) {
        this.value = value
        this.name = name
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(value: Int): InternalImmutableStruct = InternalImmutableStruct(value)
        @JvmSynthetic internal operator fun invoke(value: Int, name: String): InternalImmutableStruct = InternalImmutableStruct(value, name)
    }
}

