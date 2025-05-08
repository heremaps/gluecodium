/*

 *
 */

@file:JvmName("ExternalMarkedAsSerializable")

package com.example.kotlinsmoke

import android.os.Parcel
import android.os.Parcelable

class ExternalMarkedAsSerializable {
    @JvmField var field: Int



    constructor(field: Int) {
        this.field = field
    }





    companion object {
    }
}

