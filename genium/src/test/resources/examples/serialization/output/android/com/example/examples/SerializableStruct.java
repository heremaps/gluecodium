/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
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
    @NonNull
    public NestedSerializableStruct structField;
    @NonNull
    public List<String> arrayField;

    public SerializableStruct() {
        this(0, "", new NestedSerializableStruct(), new ArrayList<>());
    }

    public SerializableStruct(int intField, String stringField, NestedSerializableStruct structField, List<String> arrayField) {
        this.intField = intField;
        this.stringField = stringField;
        this.structField = structField;
        this.arrayField = arrayField;
    }

    private SerializableStruct(final Parcel in_parcel) {
        this.intField = in_parcel.readInt();
        this.stringField = in_parcel.readString();
        this.structField = in_parcel.readParcelable(Thread.currentThread().getContextClassLoader());
        this.arrayField = new ArrayList<>();
        in_parcel.readList(this.arrayField, Thread.currentThread().getContextClassLoader());
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
        private int intField = 0;
        private String stringField = "";
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
