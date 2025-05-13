/*

 *
 */

@file:JvmName("AttributesCrash")

package com.example.smoke


class AttributesCrashException(@JvmField val error: String) : Exception(error.toString())


