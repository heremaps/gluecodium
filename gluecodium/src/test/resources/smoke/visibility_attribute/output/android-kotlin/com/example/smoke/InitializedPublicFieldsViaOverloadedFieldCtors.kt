/*

 *
 */

@file:JvmName("InitializedPublicFieldsViaOverloadedFieldCtorsExtensions")


package com.example.smoke


/**
 * Test case 3
 *
 * Input:
 * - This structure does not define explicit constructors / field constructors.
 * - It has three public fields with default values.
 * - All fields use struct type and we check if the name of constructor is properly resolved.
 *
 * Expected outcome:
 * - Generated initialized values ctor properly resolves names.
 */
class InitializedPublicFieldsViaOverloadedFieldCtors {
    @JvmField var initializedField1: StructWithNamedFieldConstructors
    @JvmField var initializedField2: StructWithNamedFieldConstructors
    @JvmField var initializedField3: StructWithNamedFieldConstructors



    constructor() {
        this.initializedField1 = StructWithNamedFieldConstructors("abc", "def", 9, 11)
        this.initializedField2 = StructWithNamedFieldConstructors("abc", "def", 123)
        this.initializedField3 = StructWithNamedFieldConstructors("abc", "def")
    }





}

