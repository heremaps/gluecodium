/*

 *
 */

@file:JvmName("SomethingBadHappenedExtensions")


package com.example.smoke


internal class SomethingBadHappenedException(@JvmSynthetic @JvmField val error: SomeInternalEnum) : Exception(error.toString())


