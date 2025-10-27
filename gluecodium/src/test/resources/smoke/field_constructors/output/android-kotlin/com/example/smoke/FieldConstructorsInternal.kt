/*

 *
 */

@file:JvmName("FieldConstructorsInternalExtensions")

package com.example.smoke


class FieldConstructorsInternal {
    @JvmField var publicField: String
    @JvmField var internalField: Double





    internal constructor() {
        this.publicField = "foo"
        this.internalField = 42
    }


    internal constructor(publicField: String) {
        this.publicField = publicField
        this.internalField = 42
    }


    internal constructor(internalField: Double) {
        this.internalField = internalField
        this.publicField = "foo"
    }


    internal constructor(internalField: Double, publicField: String) {
        this.internalField = internalField
        this.publicField = publicField
    }





}

