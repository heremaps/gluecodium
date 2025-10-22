/*

 *
 */

@file:JvmName("NullableCollectionsStructExtensions")

package com.example.smoke

import java.util.Date

class NullableCollectionsStruct {
    @JvmField var dates: MutableList<Date?>
    @JvmField var structs: MutableMap<Int, Nullable.SomeStruct?>



    constructor(dates: MutableList<Date?>, structs: MutableMap<Int, Nullable.SomeStruct?>) {
        this.dates = dates
        this.structs = structs
    }





}

