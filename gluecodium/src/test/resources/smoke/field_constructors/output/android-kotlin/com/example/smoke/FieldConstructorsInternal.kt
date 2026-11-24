/*

 *
 */

@file:JvmName("FieldConstructorsInternalExtensions")

package com.example.smoke


class FieldConstructorsInternal {
    @JvmField var publicField: String
    @JvmField var internalField: Double





    private constructor() {
        this.publicField = "foo"
        this.internalField = 42
    }


    private constructor(publicField: String) {
        this.publicField = publicField
        this.internalField = 42
    }


    private constructor(internalField: Double) {
        this.internalField = internalField
        this.publicField = "foo"
    }


    private constructor(internalField: Double, publicField: String) {
        this.internalField = internalField
        this.publicField = publicField
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(): FieldConstructorsInternal = FieldConstructorsInternal()
        @JvmSynthetic internal operator fun invoke(publicField: String): FieldConstructorsInternal = FieldConstructorsInternal(publicField)
        @JvmSynthetic internal operator fun invoke(internalField: Double): FieldConstructorsInternal = FieldConstructorsInternal(internalField)
        @JvmSynthetic internal operator fun invoke(internalField: Double, publicField: String): FieldConstructorsInternal = FieldConstructorsInternal(internalField, publicField)
    }
}

