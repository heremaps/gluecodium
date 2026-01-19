/*

 *
 */

@file:JvmName("OuterInternalExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal class OuterInternalException(@JvmField val error: OuterInternalEnum) : Exception(error.toString())


