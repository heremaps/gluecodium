/*

 *
 */

@file:JvmName("OuterInternalStructExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal class OuterInternalStruct {
    @JvmField @JvmSynthetic internal var someField: Int



    private constructor(someField: Int) {
        this.someField = someField
    }





    internal companion object {
        @JvmSynthetic internal operator fun invoke(someField: Int): OuterInternalStruct = OuterInternalStruct(someField)
    }
}

