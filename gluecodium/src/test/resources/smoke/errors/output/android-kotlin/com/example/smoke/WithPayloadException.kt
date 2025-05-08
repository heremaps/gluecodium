/*

 *
 */

@file:JvmName("WithPayload")

package com.example.smoke


class WithPayloadException(val error: Payload) : Exception(error.toString())


