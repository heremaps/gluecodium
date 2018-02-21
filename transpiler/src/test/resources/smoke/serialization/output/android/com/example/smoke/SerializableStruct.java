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

package com.example.smoke;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SerializableStruct implements Parcelable {

    public static final Parcelable.Creator<SerializableStruct> CREATOR = new Parcelable.Creator<SerializableStruct>() {
        public SerializableStruct createFromParcel(final Parcel in_parcel) {
            return new SerializableStruct(in_parcel);
        }
        public SerializableStruct[] newArray(final int size) {
            return new SerializableStruct[size];
        }
    };

    public boolean boolField;
    public byte byteField;
    public short shortField;
    public int intField;
    public long longField;
    public float floatField;
    public double doubleField;
    public String stringField;
    public NestedSerializableStruct structField = new NestedSerializableStruct();
    public byte[] byteBufferField;
    public List<String> arrayField = new ArrayList<>();
    public List<NestedSerializableStruct> structArrayField = new ArrayList<>();
    public Map<Integer, String> mapField = new HashMap<>();
    public SomeEnum enumField = SomeEnum.values()[0];

    public SerializableStruct() {}

    public SerializableStruct(boolean boolField, byte byteField, short shortField, int intField, long longField, float floatField, double doubleField, String stringField, NestedSerializableStruct structField, byte[] byteBufferField, List<String> arrayField, List<NestedSerializableStruct> structArrayField, Map<Integer, String> mapField, SomeEnum enumField) {
        this.boolField = boolField;
        this.byteField = byteField;
        this.shortField = shortField;
        this.intField = intField;
        this.longField = longField;
        this.floatField = floatField;
        this.doubleField = doubleField;
        this.stringField = stringField;
        this.structField = structField;
        this.byteBufferField = byteBufferField;
        this.arrayField = arrayField;
        this.structArrayField = structArrayField;
        this.mapField = mapField;
        this.enumField = enumField;
    }

    private SerializableStruct(final Parcel in_parcel) {
        this.boolField = in_parcel.readByte() != 0;
        this.byteField = in_parcel.readByte();
        this.shortField = (short)in_parcel.readInt();
        this.intField = in_parcel.readInt();
        this.longField = in_parcel.readLong();
        this.floatField = in_parcel.readFloat();
        this.doubleField = in_parcel.readDouble();
        this.stringField = in_parcel.readString();
        this.structField = in_parcel.readParcelable(null);
        this.byteBufferField = in_parcel.createByteArray();
        this.arrayField = new ArrayList<>();
        in_parcel.readList(this.arrayField, null);
        this.structArrayField = new ArrayList<>();
        in_parcel.readList(this.structArrayField, null);
        this.mapField = new HashMap<>();
        in_parcel.readMap(this.mapField, null);
        this.enumField = SomeEnum.values()[in_parcel.readInt()];
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(final Parcel out_parcel, final int flags) {
        out_parcel.writeByte((byte)(boolField ? 1 : 0));
        out_parcel.writeByte(byteField);
        out_parcel.writeInt(shortField);
        out_parcel.writeInt(intField);
        out_parcel.writeLong(longField);
        out_parcel.writeFloat(floatField);
        out_parcel.writeDouble(doubleField);
        out_parcel.writeString(stringField);
        out_parcel.writeParcelable(structField, 0);
        out_parcel.writeByteArray(byteBufferField);
        out_parcel.writeList(arrayField);
        out_parcel.writeList(structArrayField);
        out_parcel.writeMap(mapField);
        out_parcel.writeInt(enumField.ordinal());
    }

    public static class Builder {
        private boolean boolField;
        private byte byteField;
        private short shortField;
        private int intField;
        private long longField;
        private float floatField;
        private double doubleField;
        private String stringField;
        private NestedSerializableStruct structField = new NestedSerializableStruct();
        private byte[] byteBufferField;
        private List<String> arrayField = new ArrayList<>();
        private List<NestedSerializableStruct> structArrayField = new ArrayList<>();
        private Map<Integer, String> mapField = new HashMap<>();
        private SomeEnum enumField = SomeEnum.values()[0];
        public Builder() {
        }
        public Builder setBoolField(boolean boolField) {
            this.boolField = boolField;
            return this;
        }
        public Builder setByteField(byte byteField) {
            this.byteField = byteField;
            return this;
        }
        public Builder setShortField(short shortField) {
            this.shortField = shortField;
            return this;
        }
        public Builder setIntField(int intField) {
            this.intField = intField;
            return this;
        }
        public Builder setLongField(long longField) {
            this.longField = longField;
            return this;
        }
        public Builder setFloatField(float floatField) {
            this.floatField = floatField;
            return this;
        }
        public Builder setDoubleField(double doubleField) {
            this.doubleField = doubleField;
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
        public Builder setByteBufferField(byte[] byteBufferField) {
            this.byteBufferField = byteBufferField;
            return this;
        }
        public Builder setArrayField(List<String> arrayField) {
            this.arrayField = arrayField;
            return this;
        }
        public Builder setStructArrayField(List<NestedSerializableStruct> structArrayField) {
            this.structArrayField = structArrayField;
            return this;
        }
        public Builder setMapField(Map<Integer, String> mapField) {
            this.mapField = mapField;
            return this;
        }
        public Builder setEnumField(SomeEnum enumField) {
            this.enumField = enumField;
            return this;
        }
        public SerializableStruct build() {
            return new SerializableStruct(boolField, byteField, shortField, intField, longField, floatField, doubleField, stringField, structField, byteBufferField, arrayField, structArrayField, mapField, enumField);
        }
    }
}
