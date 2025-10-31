/*

 *
 */

@file:JvmName("EnumCollectionDefaultsExtensions")

package com.example.smoke

import com.example.fire.Enum1
import com.example.fire.Enum2
import com.example.fire.Enum3
import com.example.fire.Enum4
import java.util.EnumSet

class EnumCollectionDefaults {
    @JvmField var listField: List<@JvmSuppressWildcards Enum1>
    @JvmField var setField: Set<@JvmSuppressWildcards Enum2>
    @JvmField var mapField: Map<@JvmSuppressWildcards Enum3, @JvmSuppressWildcards Enum4>



    constructor() {
        this.listField = listOf(Enum1.DISABLED)
        this.setField = EnumSet.of(Enum2.DISABLED)
        this.mapField = mapOf(Enum3.DISABLED to Enum4.DISABLED)
    }





}

