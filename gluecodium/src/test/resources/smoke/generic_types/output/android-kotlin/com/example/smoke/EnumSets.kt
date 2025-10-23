/*

 *
 */

@file:JvmName("EnumSetsExtensions")

package com.example.smoke

import java.util.EnumSet

class EnumSets {
    @JvmField var enumSetField: MutableSet<GenericTypesWithCompoundTypes.SomeEnum>



    constructor() {
        this.enumSetField = EnumSet.noneOf(GenericTypesWithCompoundTypes.SomeEnum::class.java)
    }





    companion object {
        @JvmField final val ENUM_SET_CONST: MutableSet<GenericTypesWithCompoundTypes.SomeEnum> = EnumSet.of(GenericTypesWithCompoundTypes.SomeEnum.FOO, GenericTypesWithCompoundTypes.SomeEnum.BAR)
    }
}

