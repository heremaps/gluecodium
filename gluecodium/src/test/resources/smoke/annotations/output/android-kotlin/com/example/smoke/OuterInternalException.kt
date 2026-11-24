/*

 *
 */

@file:JvmName("OuterInternalExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal class OuterInternalException private constructor(@JvmSynthetic @JvmField val error: OuterInternalEnum) : Exception(error.toString()) {
    internal companion object {
        @JvmSynthetic internal operator fun invoke(error: OuterInternalEnum): OuterInternalException = OuterInternalException(error)
    }
}


