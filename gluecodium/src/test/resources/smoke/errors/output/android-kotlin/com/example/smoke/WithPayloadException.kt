/*

 *
 */

@file:JvmName("WithPayloadExtensions")

package com.example.smoke


class WithPayloadException(@JvmField val error: Payload) : Exception(error.toString())


