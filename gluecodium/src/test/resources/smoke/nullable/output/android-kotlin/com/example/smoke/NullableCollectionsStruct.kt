/*

 *
 */

@file:JvmName("NullableCollectionsStructExtensions")


package com.example.smoke

import java.util.Date

class NullableCollectionsStruct {
    @JvmField var dates: List<Date?>
    @JvmField var structs: Map<Int, Nullable.SomeStruct?>



    constructor(dates: List<Date?>, structs: Map<Int, Nullable.SomeStruct?>) {
        this.dates = dates
        this.structs = structs
    }





}

