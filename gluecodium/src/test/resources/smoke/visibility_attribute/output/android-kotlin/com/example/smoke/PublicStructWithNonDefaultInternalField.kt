/*

 *
 */

@file:JvmName("PublicStructWithNonDefaultInternalField")

package com.example.smoke


class PublicStructWithNonDefaultInternalField {
    var defaultedField: Int
    internal var internalField: String
    var publicField: Boolean



    internal constructor(internalField: String, publicField: Boolean) {
        this.defaultedField = 42
        this.internalField = internalField
        this.publicField = publicField
    }





}

