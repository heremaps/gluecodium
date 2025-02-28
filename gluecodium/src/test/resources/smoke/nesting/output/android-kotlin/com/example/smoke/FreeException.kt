/*

 *
 */

package com.example.smoke


class FreeException(val error: FreeEnum) : Exception(error.toString())


