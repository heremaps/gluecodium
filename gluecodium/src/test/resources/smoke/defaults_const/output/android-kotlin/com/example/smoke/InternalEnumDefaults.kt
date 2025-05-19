/*

 *
 */

@file:JvmName("InternalEnumDefaults")

package com.example.smoke


class InternalEnumDefaults {
    @JvmField var publicField: FooBarEnum
    @JvmField var publicListField: MutableList<FooBarEnum>
    @JvmField var internalField: FooBarEnum
    @JvmField var internalListField: MutableList<FooBarEnum>



    constructor() {
        this.publicField = FooBarEnum.FOO
        this.publicListField = mutableListOf(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ)
        this.internalField = FooBarEnum.BAR
        this.internalListField = mutableListOf(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ)
    }





}

