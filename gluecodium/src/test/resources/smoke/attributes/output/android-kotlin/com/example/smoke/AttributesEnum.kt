/*

 *
 */

@file:JvmName("AttributesEnum")

package com.example.smoke


@OnEnumeration
enum class AttributesEnum(private val value: Int) {
    @OnEnumerator
    NOPE(0);
}
