/*

 *
 */

@file:JvmName("Free")

package com.example.smoke


class FreeException(@JvmField val error: FreeEnum) : Exception(error.toString())


