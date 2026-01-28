/*

 *
 */

@file:JvmName("OuterInternalInterfaceExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal interface OuterInternalInterface {



    @JvmSynthetic fun someFunction() : Int

    var someProperty: Int
        @JvmSynthetic get
        @JvmSynthetic set


}

