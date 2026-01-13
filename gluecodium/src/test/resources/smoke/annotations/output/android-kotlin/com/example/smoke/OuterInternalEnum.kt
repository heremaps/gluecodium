/*

 *
 */

@file:JvmName("OuterInternalEnumExtensions")

package com.example.smoke

import com.example.MySmokeTestsInternalApi

@MySmokeTestsInternalApi
internal enum class OuterInternalEnum(@JvmField internal val value: Int) {
    FIRST(1),
    SECOND(2);
}
