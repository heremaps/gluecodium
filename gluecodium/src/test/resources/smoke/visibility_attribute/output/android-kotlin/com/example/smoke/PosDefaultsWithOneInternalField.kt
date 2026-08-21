/*

 *
 */

@file:JvmName("PosDefaultsWithOneInternalFieldExtensions")


package com.example.smoke


/**
 * Test case 4
 *
 * Input:
 * - The structure uses `PositionalDefaults` and should get such constructor.
 * - This structure does not define other constructors / field constructors.
 * - It has one public field with default value.
 * - One of fields is internal.
 *
 * Expected outcome:
 * - Generated positional defaults constructor is not public (because it would expose internal field).
 */
class PosDefaultsWithOneInternalField {
    @JvmField @JvmSynthetic internal var internalField: String
    @JvmField var publicField: Boolean
    @JvmField var initializedField: Int



    @JvmOverloads
    constructor(internalField: String, publicField: Boolean, initializedField: Int = 77) {
        this.internalField = internalField
        this.publicField = publicField
        this.initializedField = initializedField
    }





}

