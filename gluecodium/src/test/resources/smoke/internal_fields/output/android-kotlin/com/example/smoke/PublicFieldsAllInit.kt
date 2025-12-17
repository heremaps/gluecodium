/*

 *
 */

@file:JvmName("PublicFieldsAllInitExtensions")

package com.example.smoke


class PublicFieldsAllInit {
    @JvmField var publicField: String
    @JvmField @JvmSynthetic internal var internalField: String



    constructor() {
        this.publicField = "bar"
        this.internalField = "foo"
    }





}

