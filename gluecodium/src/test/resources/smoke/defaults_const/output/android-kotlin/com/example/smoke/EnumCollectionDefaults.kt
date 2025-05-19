/*

 *
 */

@file:JvmName("EnumCollectionDefaults")

package com.example.smoke

import com.example.fire.Enum1
import com.example.fire.Enum2
import com.example.fire.Enum3
import com.example.fire.Enum4
import java.util.EnumSet

class EnumCollectionDefaults {
    @JvmField var listField: MutableList<Enum1>
    @JvmField var setField: MutableSet<Enum2>
    @JvmField var mapField: MutableMap<Enum3, Enum4>



    constructor() {
        this.listField = mutableListOf(Enum1.DISABLED)
        this.setField = EnumSet.of(Enum2.DISABLED)
        this.mapField = mutableMapOf(Enum3.DISABLED to Enum4.DISABLED)
    }





}

