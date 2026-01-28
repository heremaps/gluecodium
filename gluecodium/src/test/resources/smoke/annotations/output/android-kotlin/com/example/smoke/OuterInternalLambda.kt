/*

 *
 */

@file:JvmName("OuterInternalLambdaExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal fun interface OuterInternalLambda {


    @JvmSynthetic fun apply(p0: String) : Int
}

