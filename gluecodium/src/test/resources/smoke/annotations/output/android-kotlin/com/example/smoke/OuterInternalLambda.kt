/*

 *
 */

@file:JvmName("OuterInternalLambdaExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal fun interface OuterInternalLambda {


    fun apply(p0: String) : Int
}

