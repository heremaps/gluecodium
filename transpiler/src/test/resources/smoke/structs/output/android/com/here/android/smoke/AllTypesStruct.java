/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
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

public class AllTypesStruct {
    public byte int8Field;
    public long uint8Field;
    public short int16Field;
    public long uint16Field;
    public int int32Field;
    public long uint32Field;
    public long int64Field;
    public long uint64Field;
    public float floatField;
    public double doubleField;
    public String stringField;
    public boolean booleanField;
    public byte[] bytesField;
    public Point pointField = new Point();

    public AllTypesStruct() {}
    public AllTypesStruct(byte int8Field, long uint8Field, short int16Field, long uint16Field, int int32Field, long uint32Field, long int64Field, long uint64Field, float floatField, double doubleField, String stringField, boolean booleanField, byte[] bytesField, Point pointField) {
        this.int8Field = int8Field;
        this.uint8Field = uint8Field;
        this.int16Field = int16Field;
        this.uint16Field = uint16Field;
        this.int32Field = int32Field;
        this.uint32Field = uint32Field;
        this.int64Field = int64Field;
        this.uint64Field = uint64Field;
        this.floatField = floatField;
        this.doubleField = doubleField;
        this.stringField = stringField;
        this.booleanField = booleanField;
        this.bytesField = bytesField;
        this.pointField = pointField;
    }
    public static class Builder {
        public byte int8Field;
        public long uint8Field;
        public short int16Field;
        public long uint16Field;
        public int int32Field;
        public long uint32Field;
        public long int64Field;
        public long uint64Field;
        public float floatField;
        public double doubleField;
        public String stringField;
        public boolean booleanField;
        public byte[] bytesField;
        public Point pointField = new Point();
        public Builder() {
        }
        public Builder setInt8Field(byte int8Field) {
            this.int8Field = int8Field;
            return this;
        }
        public Builder setUint8Field(long uint8Field) {
            this.uint8Field = uint8Field;
            return this;
        }
        public Builder setInt16Field(short int16Field) {
            this.int16Field = int16Field;
            return this;
        }
        public Builder setUint16Field(long uint16Field) {
            this.uint16Field = uint16Field;
            return this;
        }
        public Builder setInt32Field(int int32Field) {
            this.int32Field = int32Field;
            return this;
        }
        public Builder setUint32Field(long uint32Field) {
            this.uint32Field = uint32Field;
            return this;
        }
        public Builder setInt64Field(long int64Field) {
            this.int64Field = int64Field;
            return this;
        }
        public Builder setUint64Field(long uint64Field) {
            this.uint64Field = uint64Field;
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
        public Builder setBooleanField(boolean booleanField) {
            this.booleanField = booleanField;
            return this;
        }
        public Builder setBytesField(byte[] bytesField) {
            this.bytesField = bytesField;
            return this;
        }
        public Builder setPointField(Point pointField) {
            this.pointField = pointField;
            return this;
        }
        public AllTypesStruct build() {
            return new AllTypesStruct(int8Field, uint8Field, int16Field, uint16Field, int32Field, uint32Field, int64Field, uint64Field, floatField, doubleField, stringField, booleanField, bytesField, pointField);
        }
    }
}