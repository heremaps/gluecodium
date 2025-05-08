/*

 *
 */

@file:JvmName("NullableCollectionsStruct")

package com.example.smoke

import java.util.Date

class NullableCollectionsStruct {
    var dates: MutableList<Date?>
    var structs: MutableMap<Int, Nullable.SomeStruct?>



    constructor(dates: MutableList<Date?>, structs: MutableMap<Int, Nullable.SomeStruct?>) {
        this.dates = dates
        this.structs = structs
    }





}

