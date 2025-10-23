/*

 *
 */

@file:JvmName("PublicFieldsAllInitPosDefaultsExtensions")

package com.example.smoke


class PublicFieldsAllInitPosDefaults {
    @JvmField var publicField: String
    @JvmField internal var internalField: String



    @JvmOverloads
    constructor(publicField: String = "bar", internalField: String = "foo") {
        this.publicField = publicField
        this.internalField = internalField
    }





}

