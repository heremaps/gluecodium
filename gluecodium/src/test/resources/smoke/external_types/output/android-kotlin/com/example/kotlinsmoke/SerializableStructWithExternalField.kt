/*

 *
 */

@file:JvmName("SerializableStructWithExternalFieldExtensions")

package com.example.kotlinsmoke

import android.os.Parcel
import android.os.Parcelable

class SerializableStructWithExternalField : Parcelable {
    @JvmField var someStruct: com.here.android.test.AnExternalStruct



    constructor(someStruct: com.here.android.test.AnExternalStruct) {
        this.someStruct = someStruct
    }


    private constructor(parcel: Parcel) {
        this.someStruct = parcel.readParcelable(Thread.currentThread().getContextClassLoader())!!
    }

    override fun describeContents() = 0

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeParcelable(someStruct, 0)
    }





    companion object {
        @JvmField
        val CREATOR = object : Parcelable.Creator<SerializableStructWithExternalField> {
            override fun createFromParcel(parcel: Parcel) = SerializableStructWithExternalField(parcel)
            override fun newArray(size: Int) = arrayOfNulls<SerializableStructWithExternalField?>(size)
        }

    }
}

