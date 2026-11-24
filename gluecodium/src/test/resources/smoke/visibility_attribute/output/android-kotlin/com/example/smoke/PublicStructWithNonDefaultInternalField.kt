/*

 *
 */

@file:JvmName("PublicStructWithNonDefaultInternalFieldExtensions")

package com.example.smoke


class PublicStructWithNonDefaultInternalField {
    @JvmField var defaultedField: Int
    @JvmField @JvmSynthetic internal var internalField: String
    @JvmField var publicField: Boolean



    private constructor(internalField: String, publicField: Boolean) {
        this.defaultedField = 42
        this.internalField = internalField
        this.publicField = publicField
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(internalField: String, publicField: Boolean): PublicStructWithNonDefaultInternalField = PublicStructWithNonDefaultInternalField(internalField, publicField)
    }
}

