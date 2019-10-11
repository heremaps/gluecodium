/*
 *
 */
package com.example.smoke;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class SerializableStruct implements Parcelable {
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
    @NonNull
    public String stringField;
    @NonNull
    public NestedSerializableStruct structField;
    @NonNull
    public byte[] byteBufferField;
    @NonNull
    public List<String> arrayField;
    @NonNull
    public List<NestedSerializableStruct> structArrayField;
    @NonNull
    public Map<Integer, String> mapField;
    @NonNull
    public Set<String> setField;
    @NonNull
    public Set<SomeEnum> enumSetField;
    @NonNull
    public SomeEnum enumField;
    public SerializableStruct(final boolean boolField, final byte byteField, final short shortField, final int intField, final long longField, final float floatField, final double doubleField, @NonNull final String stringField, @NonNull final NestedSerializableStruct structField, @NonNull final byte[] byteBufferField, @NonNull final List<String> arrayField, @NonNull final List<NestedSerializableStruct> structArrayField, @NonNull final Map<Integer, String> mapField, @NonNull final Set<String> setField, @NonNull final Set<SomeEnum> enumSetField, @NonNull final SomeEnum enumField) {
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
        this.setField = setField;
        this.enumSetField = enumSetField;
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
        this.structField = in_parcel.readParcelable(Thread.currentThread().getContextClassLoader());
        this.byteBufferField = in_parcel.createByteArray();
        this.arrayField = new ArrayList<>();
        in_parcel.readList(this.arrayField, Thread.currentThread().getContextClassLoader());
        this.structArrayField = new ArrayList<>();
        in_parcel.readList(this.structArrayField, Thread.currentThread().getContextClassLoader());
        this.mapField = new HashMap<>();
        in_parcel.readMap(this.mapField, Thread.currentThread().getContextClassLoader());
        java.util.ArrayList<String> __setField = new java.util.ArrayList<>();
        in_parcel.readList(__setField, Thread.currentThread().getContextClassLoader());
        this.setField = new HashSet<>(__setField);
        java.util.ArrayList<SomeEnum> __enumSetField = new java.util.ArrayList<>();
        in_parcel.readList(__enumSetField, Thread.currentThread().getContextClassLoader());
        this.enumSetField = EnumSet.copyOf(__enumSetField);
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
        out_parcel.writeList(java.util.Arrays.asList(setField.toArray()));
        out_parcel.writeList(java.util.Arrays.asList(enumSetField.toArray()));
        out_parcel.writeInt(enumField.ordinal());
    }
}
