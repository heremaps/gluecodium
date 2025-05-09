/*

 *
 */

@file:JvmName("WithPayload")

package com.example.smoke


class WithPayloadException(@JvmField val error: Payload) : Exception(error.toString())


