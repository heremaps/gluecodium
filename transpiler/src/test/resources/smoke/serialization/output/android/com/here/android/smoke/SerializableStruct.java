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

package com.here.android.smoke;

import android.os.Parcel;
import android.os.Parcelable;

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

    public SerializableStruct() {}

    public SerializableStruct(boolean boolField, byte byteField, short shortField, int intField, long longField, float floatField, double doubleField, String stringField) {
        this.boolField = boolField;
        this.byteField = byteField;
        this.shortField = shortField;
        this.intField = intField;
        this.longField = longField;
        this.floatField = floatField;
        this.doubleField = doubleField;
        this.stringField = stringField;
    }

    private SerializableStruct(final Parcel in_parcel) {
        this.boolField = in_parcel.readByte() != 0;
        this.byteField = in_parcel.readByte();
        this.shortField = in_parcel.readShort();
        this.intField = in_parcel.readInt();
        this.longField = in_parcel.readLong();
        this.floatField = in_parcel.readFloat();
        this.doubleField = in_parcel.readDouble();
        this.stringField = in_parcel.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(final Parcel out_parcel, final int flags) {
        out_parcel.writeByte((byte) (boolField ? 1 : 0));
        out_parcel.writeByte(byteField);
        out_parcel.writeShort(shortField);
        out_parcel.writeInt(intField);
        out_parcel.writeLong(longField);
        out_parcel.writeFloat(floatField);
        out_parcel.writeDouble(doubleField);
        out_parcel.writeString(stringField);
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
        public SerializableStruct build() {
            return new SerializableStruct(boolField, byteField, shortField, intField, longField, floatField, doubleField, stringField);
        }
    }
}