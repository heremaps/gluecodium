/*

 *
 */

package com.example.smoke


class EnumSets {
    var enumSetField: MutableSet<GenericTypesWithCompoundTypes.SomeEnum>



    constructor() {
        this.enumSetField = mutableSetOf()
    }




    companion object {
        val ENUM_SET_CONST: MutableSet<GenericTypesWithCompoundTypes.SomeEnum> = mutableSetOf(GenericTypesWithCompoundTypes.SomeEnum.FOO, GenericTypesWithCompoundTypes.SomeEnum.BAR)
    }
}

