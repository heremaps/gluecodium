/*

 *
 */

@file:JvmName("OuterInternalInterfaceExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal fun interface OuterInternalInterface {



    fun someFunction() : Int


}

