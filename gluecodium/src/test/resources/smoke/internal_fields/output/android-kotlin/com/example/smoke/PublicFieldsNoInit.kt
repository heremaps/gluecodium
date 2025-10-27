/*

 *
 */

@file:JvmName("PublicFieldsNoInitExtensions")

package com.example.smoke


class PublicFieldsNoInit {
    @JvmField var publicField: String
    @JvmField internal var internalField: String



    constructor(publicField: String) {
        this.publicField = publicField
        this.internalField = "foo"
    }





}

