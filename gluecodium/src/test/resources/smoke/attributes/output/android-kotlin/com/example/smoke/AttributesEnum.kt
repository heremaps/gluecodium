/*

 *
 */

@file:JvmName("AttributesEnum")

package com.example.smoke


@OnEnumeration
enum class AttributesEnum(@JvmField val value: Int) {
    @OnEnumerator
    NOPE(0);
}
