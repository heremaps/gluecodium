/*

 *
 */

@file:JvmName("PublicFieldsAllInit")

package com.example.smoke


class PublicFieldsAllInit {
    @JvmField var publicField: String
    @JvmField internal var internalField: String



    constructor() {
        this.publicField = "bar"
        this.internalField = "foo"
    }





}

