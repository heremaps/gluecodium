/*

 *
 */

@file:JvmName("InternalEnumDefaultsExtensions")

package com.example.smoke


class InternalEnumDefaults {
    @JvmField var publicField: FooBarEnum
    @JvmField var publicListField: List<@JvmSuppressWildcards FooBarEnum>
    @JvmField internal var internalField: FooBarEnum
    @JvmField internal var internalListField: List<@JvmSuppressWildcards FooBarEnum>



    constructor() {
        this.publicField = FooBarEnum.FOO
        this.publicListField = mutableListOf(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ)
        this.internalField = FooBarEnum.BAR
        this.internalListField = mutableListOf(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ)
    }





}

