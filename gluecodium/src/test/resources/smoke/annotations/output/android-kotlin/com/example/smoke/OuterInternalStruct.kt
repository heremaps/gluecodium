/*

 *
 */

@file:JvmName("OuterInternalStructExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal class OuterInternalStruct {
    @JvmField var someField: Int



    constructor(someField: Int) {
        this.someField = someField
    }





}

