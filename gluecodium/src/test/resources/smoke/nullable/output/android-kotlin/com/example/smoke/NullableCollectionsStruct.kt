/*

 *
 */

@file:JvmName("NullableCollectionsStructExtensions")

package com.example.smoke

import java.util.Date

class NullableCollectionsStruct {
    @JvmField var dates: List<@JvmSuppressWildcards Date?>
    @JvmField var structs: Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Nullable.SomeStruct?>



    constructor(dates: List<@JvmSuppressWildcards Date?>, structs: Map<@JvmSuppressWildcards Int, @JvmSuppressWildcards Nullable.SomeStruct?>) {
        this.dates = dates
        this.structs = structs
    }





}

