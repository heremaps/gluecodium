/*
 * Copyright (C) 2016-2021 HERE Europe B.V.
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
package com.here.android.test;

import android.os.Parcel;
import android.os.Parcelable;

class AnExternalStruct implements Parcelable {

  public int mData;

  private AnExternalStruct(Parcel in) {
    mData = in.readInt();
  }

  public AnExternalStruct(int data) {
    mData = data;
  }

  @Override
  public int describeContents() {
    return 0;
  }

  @Override
  public void writeToParcel(Parcel parcel, int i) {
    parcel.writeInt(mData);
  }

  public static final Parcelable.Creator<AnExternalStruct> CREATOR = new Parcelable.Creator<AnExternalStruct>() {

    @Override
    public AnExternalStruct createFromParcel(Parcel parcel) {
      return new AnExternalStruct(parcel);
    }

    @Override
    public AnExternalStruct[] newArray(int i) {
      return new AnExternalStruct[i];
    }
  };
}
