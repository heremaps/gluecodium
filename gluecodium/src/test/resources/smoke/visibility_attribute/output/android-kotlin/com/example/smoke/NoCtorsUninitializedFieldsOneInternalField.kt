/*

 *
 */

@file:JvmName("NoCtorsUninitializedFieldsOneInternalFieldExtensions")


package com.example.smoke


/**
 * Test case 1
 *
 * Input:
 * - This structure does not define explicit constructors / field constructors.
 * - It has fields without default values.
 * - One of fields is internal.
 *
 * Expected outcome:
 * - Generated all args constructor is not public (because it would expose internal field).
 */
class NoCtorsUninitializedFieldsOneInternalField {
    @JvmField @JvmSynthetic internal var internalField: String
    @JvmField var publicField: Boolean



    internal constructor(internalField: String, publicField: Boolean) {
        this.internalField = internalField
        this.publicField = publicField
    }





}

