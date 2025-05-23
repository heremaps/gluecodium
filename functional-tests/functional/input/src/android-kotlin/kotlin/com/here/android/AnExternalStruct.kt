/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */
package com.here.android.test

import android.os.Parcel
import android.os.Parcelable

class AnExternalStruct : Parcelable {
    @JvmField var mData: Int

    private constructor(parcel: Parcel) {
        this.mData = parcel.readInt()
    }

    constructor(data: Int) {
        this.mData = data
    }

    override fun describeContents() = 0
    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeInt(mData)
    }

    companion object CREATOR : Parcelable.Creator<AnExternalStruct> {
        override fun createFromParcel(parcel: Parcel) = AnExternalStruct(parcel)
        override fun newArray(size: Int) = arrayOfNulls<AnExternalStruct?>(size)
    }
}
