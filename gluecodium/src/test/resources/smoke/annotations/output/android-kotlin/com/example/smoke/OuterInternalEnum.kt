/*

 *
 */

@file:JvmName("OuterInternalEnumExtensions")
@file:androidx.annotation.OptIn(com.example.MySmokeTestsInternalApi::class)

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal enum class OuterInternalEnum(@JvmField @JvmSynthetic internal val value: Int) {
    FIRST(1),
    SECOND(2);
}
