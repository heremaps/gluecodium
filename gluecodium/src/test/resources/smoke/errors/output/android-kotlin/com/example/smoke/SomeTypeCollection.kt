/*

 *
 */

@file:JvmName("SomeTypeCollection")

package com.example.smoke


class SomeTypeCollection {

    enum class SomeTypeCollectionError(private val value: Int) {
        ERROR_A(0),
        ERROR_B(1);
    }
    class SomeException(val error: SomeTypeCollection.SomeTypeCollectionError) : Exception(error.toString())









}

