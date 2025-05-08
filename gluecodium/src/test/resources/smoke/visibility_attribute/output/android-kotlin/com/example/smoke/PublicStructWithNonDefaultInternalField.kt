/*

 *
 */

@file:JvmName("PublicStructWithNonDefaultInternalField")

package com.example.smoke


class PublicStructWithNonDefaultInternalField {
    @JvmField var defaultedField: Int
    @JvmField var internalField: String
    @JvmField var publicField: Boolean



    constructor(internalField: String, publicField: Boolean) {
        this.defaultedField = 42
        this.internalField = internalField
        this.publicField = publicField
    }





}

