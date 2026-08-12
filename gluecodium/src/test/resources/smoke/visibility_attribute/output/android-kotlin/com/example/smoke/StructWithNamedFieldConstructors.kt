/*

 *
 */

@file:JvmName("StructWithNamedFieldConstructorsExtensions")


package com.example.smoke


/**
 * A helper structure for test case 3.
 * It defines a few named field constructors.
 * All fields are public.
 * Two of them are initialized.
 */
class StructWithNamedFieldConstructors {
    @JvmField var field1: String
    @JvmField var field2: String
    @JvmField var initializedField1: Int
    @JvmField var initializedField2: Int





    constructor(field1: String, field2: String, initializedField1: Int, initializedField2: Int) {
        this.field1 = field1
        this.field2 = field2
        this.initializedField1 = initializedField1
        this.initializedField2 = initializedField2
    }


    constructor(field1: String, field2: String) {
        this.field1 = field1
        this.field2 = field2
        this.initializedField1 = 77
        this.initializedField2 = 101
    }


    constructor(field1: String, field2: String, initializedField1: Int) {
        this.field1 = field1
        this.field2 = field2
        this.initializedField1 = initializedField1
        this.initializedField2 = 101
    }





}

