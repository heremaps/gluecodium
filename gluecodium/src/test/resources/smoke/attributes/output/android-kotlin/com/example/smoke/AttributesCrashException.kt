/*

 *
 */

@file:JvmName("AttributesCrashExtensions")

package com.example.smoke


@OnException
class AttributesCrashException(@JvmField val error: String) : Exception(error.toString())


