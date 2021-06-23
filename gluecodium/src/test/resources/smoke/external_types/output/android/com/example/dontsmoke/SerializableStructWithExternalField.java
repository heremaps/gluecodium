/*
 *
 */
package com.example.dontsmoke;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
public final class SerializableStructWithExternalField implements Parcelable {
    public static final Parcelable.Creator<SerializableStructWithExternalField> CREATOR = new Parcelable.Creator<SerializableStructWithExternalField>() {
        public SerializableStructWithExternalField createFromParcel(final Parcel in_parcel) {
            return new SerializableStructWithExternalField(in_parcel);
        }
        public SerializableStructWithExternalField[] newArray(final int size) {
            return new SerializableStructWithExternalField[size];
        }
    };
    @NonNull
    public com.here.android.test.AnExternalStruct someStruct;
    public SerializableStructWithExternalField(@NonNull final com.here.android.test.AnExternalStruct someStruct) {
        this.someStruct = someStruct;
    }
    private SerializableStructWithExternalField(final Parcel in_parcel) {
        this.someStruct = in_parcel.readParcelable(Thread.currentThread().getContextClassLoader());
    }
    @Override
    public int describeContents() {
        return 0;
    }
    @Override
    public void writeToParcel(final Parcel out_parcel, final int flags) {
        out_parcel.writeParcelable(someStruct, 0);
    }
}