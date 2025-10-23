/*

 *
 */

@file:JvmName("StructWithPosEnumsExtensions")

package com.example.smoke


class StructWithPosEnums {
    @JvmField var firstField: SomethingEnum
    @JvmField var explicitField: SomethingEnum
    @JvmField var lastField: SomethingEnum



    constructor() {
        this.firstField = SomethingEnum.REALLY_FIRST
        this.explicitField = SomethingEnum.EXPLICIT
        this.lastField = SomethingEnum.LAST
    }





    companion object {
        @JvmField final val FIRST_CONSTANT: SomethingEnum = SomethingEnum.REALLY_FIRST
    }
}

