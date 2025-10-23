/*

 *
 */

@file:JvmName("PublicFieldsMixedInitExtensions")

package com.example.smoke


class PublicFieldsMixedInit {
    @JvmField var publicField1: String
    @JvmField var publicField2: String
    @JvmField internal var internalField: String



    constructor(publicField2: String) {
        this.publicField1 = "bar"
        this.publicField2 = publicField2
        this.internalField = "foo"
    }





}

