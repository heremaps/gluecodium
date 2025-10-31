/*

 *
 */

@file:JvmName("EnumCollectionDefaultsExternalExtensions")

package com.example.smoke

import java.util.EnumSet

class EnumCollectionDefaultsExternal {
    @JvmField var listField: List<@JvmSuppressWildcards foo.AlienEnum1>
    @JvmField var setField: Set<@JvmSuppressWildcards foo.AlienEnum2>
    @JvmField var mapField: Map<@JvmSuppressWildcards foo.AlienEnum3, @JvmSuppressWildcards foo.AlienEnum4>



    constructor() {
        this.listField = mutableListOf(foo.AlienEnum1.DISABLED)
        this.setField = EnumSet.of(foo.AlienEnum2.DISABLED)
        this.mapField = mutableMapOf(foo.AlienEnum3.DISABLED to foo.AlienEnum4.DISABLED)
    }





}

