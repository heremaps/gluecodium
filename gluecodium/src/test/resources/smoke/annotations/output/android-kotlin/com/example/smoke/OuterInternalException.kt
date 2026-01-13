/*

 *
 */

@file:JvmName("OuterInternalExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal class OuterInternalException(@JvmField val error: OuterInternalEnum) : Exception(error.toString())


