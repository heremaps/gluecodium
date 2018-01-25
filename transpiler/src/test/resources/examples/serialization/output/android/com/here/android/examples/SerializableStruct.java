/*
 * Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.here.android.examples;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.List;

public class SerializableStruct implements Parcelable {

    public static final Parcelable.Creator<SerializableStruct> CREATOR = new Parcelable.Creator<SerializableStruct>() {

        public SerializableStruct createFromParcel(final Parcel in_parcel) {
            return new SerializableStruct(in_parcel);
        }

        public SerializableStruct[] newArray(final int size) {
            return new SerializableStruct[size];
        }
    };

    public int intField;
    public String stringField;
    public NestedSerializableStruct structField = new NestedSerializableStruct();
    public List<String> arrayField = new ArrayList<>();

    public SerializableStruct() {}

    public SerializableStruct(int intField, String stringField, NestedSerializableStruct structField, List<String> arrayField) {
        this.intField = intField;
        this.stringField = stringField;
        this.structField = structField;
        this.arrayField = arrayField;
    }

    private SerializableStruct(final Parcel in_parcel) {
        this.intField = in_parcel.readInt();
        this.stringField = in_parcel.readString();
        this.structField = in_parcel.readParcelable(null);
        this.arrayField = new ArrayList<>();
        in_parcel.readList(this.arrayField, null);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(final Parcel out_parcel, final int flags) {
        out_parcel.writeInt(intField);
        out_parcel.writeString(stringField);
        out_parcel.writeParcelable(structField, 0);
        out_parcel.writeList(arrayField);
    }

    public static class Builder {
        private int intField;
        private String stringField;
        private NestedSerializableStruct structField = new NestedSerializableStruct();
        private List<String> arrayField = new ArrayList<>();
        public Builder() {
        }
        public Builder setIntField(int intField) {
            this.intField = intField;
            return this;
        }
        public Builder setStringField(String stringField) {
            this.stringField = stringField;
            return this;
        }
        public Builder setStructField(NestedSerializableStruct structField) {
            this.structField = structField;
            return this;
        }
        public Builder setArrayField(List<String> arrayField) {
            this.arrayField = arrayField;
            return this;
        }
        public SerializableStruct build() {
            return new SerializableStruct(intField, stringField, structField, arrayField);
        }
    }
}
