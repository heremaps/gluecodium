/*

 *
 */

@file:JvmName("SomethingBadHappenedExtensions")

package com.example.smoke


internal class SomethingBadHappenedException private constructor(@JvmSynthetic @JvmField val error: SomeInternalEnum) : Exception(error.toString()) {
    internal companion object {
        @JvmSynthetic internal operator fun invoke(error: SomeInternalEnum): SomethingBadHappenedException = SomethingBadHappenedException(error)
    }
}


