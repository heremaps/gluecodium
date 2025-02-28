/*

 *
 */

package com.example.smoke

import java.util.EnumSet

class EnumSets {
    var enumSetField: MutableSet<GenericTypesWithCompoundTypes.SomeEnum>



    constructor() {
        this.enumSetField = EnumSet.noneOf(GenericTypesWithCompoundTypes.SomeEnum::class.java)
    }




    companion object {
        val ENUM_SET_CONST: MutableSet<GenericTypesWithCompoundTypes.SomeEnum> = EnumSet.of(GenericTypesWithCompoundTypes.SomeEnum.FOO, GenericTypesWithCompoundTypes.SomeEnum.BAR)
    }
}

