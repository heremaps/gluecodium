/*

 *
 */

@file:JvmName("ConstantDefaultsExtensions")

package com.example.smoke

import com.example.fire.SomeStruct

class ConstantDefaults {
    @JvmField var field1: SomeStruct
    @JvmField var field2: SomeStruct



    constructor() {
        this.field1 = com.example.fire.StructConstants.DUMMY
        this.field2 = com.example.fire.StructConstants.DUMMY4
    }





}

