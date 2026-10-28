/*

 *
 */

@file:JvmName("ExternalMarkedAsSerializableExtensions")


package com.example.kotlinsmoke

import android.os.Parcel
import android.os.Parcelable

internal class ExternalMarkedAsSerializable {
    @JvmField @JvmSynthetic internal var field: Int



    private constructor(field: Int) {
        this.field = field
    }





    companion object {
        @JvmSynthetic internal operator fun invoke(field: Int): ExternalMarkedAsSerializable = ExternalMarkedAsSerializable(field)
    }
}

