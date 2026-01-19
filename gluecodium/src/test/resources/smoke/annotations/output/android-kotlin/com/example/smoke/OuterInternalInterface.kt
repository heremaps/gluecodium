/*

 *
 */

@file:JvmName("OuterInternalInterfaceExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal fun interface OuterInternalInterface {



    fun someFunction() : Int


}

