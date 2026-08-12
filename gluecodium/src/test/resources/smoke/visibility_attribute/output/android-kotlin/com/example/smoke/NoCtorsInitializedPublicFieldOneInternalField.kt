/*

 *
 */

@file:JvmName("NoCtorsInitializedPublicFieldOneInternalFieldExtensions")


package com.example.smoke


/**
 * Test case 2
 *
 * Input:
 * - This structure does not define explicit constructors / field constructors.
 * - It has one public field with default value.
 * - One of fields is internal.
 *
 * Expected outcome:
 * - Generated initialized args constructor is not public (because it would expose internal field).
 */
class NoCtorsInitializedPublicFieldOneInternalField {
    @JvmField @JvmSynthetic internal var internalField: String
    @JvmField var publicField: Boolean
    @JvmField var initializedField: Int



    internal constructor(internalField: String, publicField: Boolean) {
        this.internalField = internalField
        this.publicField = publicField
        this.initializedField = 77
    }





}

