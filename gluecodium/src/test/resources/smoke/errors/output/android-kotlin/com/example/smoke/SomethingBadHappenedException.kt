/*

 *
 */

@file:JvmName("SomethingBadHappenedExtensions")

package com.example.smoke


internal class SomethingBadHappenedException(@JvmField val error: SomeInternalEnum) : Exception(error.toString())


