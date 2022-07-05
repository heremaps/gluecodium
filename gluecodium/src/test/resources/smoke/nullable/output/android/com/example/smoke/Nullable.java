/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
public final class Nullable extends NativeBase {
    public enum SomeEnum {
        ON(0),
        OFF(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static final class SomeStruct {
        @NonNull
        public String stringField;
        public SomeStruct(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    public static final class NullableStruct {
        @Nullable
        public String stringField;
        @Nullable
        public Boolean boolField;
        @Nullable
        public Double doubleField;
        @Nullable
        public Nullable.SomeStruct structField;
        @Nullable
        public Nullable.SomeEnum enumField;
        @Nullable
        public List<String> arrayField;
        @Nullable
        public List<String> inlineArrayField;
        @Nullable
        public Map<Long, String> mapField;
        @Nullable
        public SomeInterface instanceField;
        public NullableStruct() {
            this.stringField = null;
            this.boolField = null;
            this.doubleField = null;
            this.structField = null;
            this.enumField = null;
            this.arrayField = null;
            this.inlineArrayField = null;
            this.mapField = null;
            this.instanceField = null;
        }
    }
    public static final class NullableIntsStruct {
        @Nullable
        public Byte int8Field;
        @Nullable
        public Short int16Field;
        @Nullable
        public Integer int32Field;
        @Nullable
        public Long int64Field;
        @Nullable
        public Short uint8Field;
        @Nullable
        public Integer uint16Field;
        @Nullable
        public Long uint32Field;
        @Nullable
        public Long uint64Field;
        public NullableIntsStruct() {
            this.int8Field = null;
            this.int16Field = null;
            this.int32Field = null;
            this.int64Field = null;
            this.uint8Field = null;
            this.uint16Field = null;
            this.uint32Field = null;
            this.uint64Field = null;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Nullable(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Nullable
    public native String methodWithString(@Nullable final String input);
    @Nullable
    public native Boolean methodWithBoolean(@Nullable final Boolean input);
    @Nullable
    public native Double methodWithDouble(@Nullable final Double input);
    @Nullable
    public native Long methodWithInt(@Nullable final Long input);
    @Nullable
    public native Nullable.SomeStruct methodWithSomeStruct(@Nullable final Nullable.SomeStruct input);
    @Nullable
    public native Nullable.SomeEnum methodWithSomeEnum(@Nullable final Nullable.SomeEnum input);
    @Nullable
    public native List<String> methodWithSomeArray(@Nullable final List<String> input);
    @Nullable
    public native List<String> methodWithInlineArray(@Nullable final List<String> input);
    @Nullable
    public native Map<Long, String> methodWithSomeMap(@Nullable final Map<Long, String> input);
    @Nullable
    public native SomeInterface methodWithInstance(@Nullable final SomeInterface input);
    @Nullable
    public native String getStringProperty();
    public native void setStringProperty(@Nullable final String value);
    @Nullable
    public native Boolean isBoolProperty();
    public native void setBoolProperty(@Nullable final Boolean value);
    @Nullable
    public native Double getDoubleProperty();
    public native void setDoubleProperty(@Nullable final Double value);
    @Nullable
    public native Long getIntProperty();
    public native void setIntProperty(@Nullable final Long value);
    @Nullable
    public native Nullable.SomeStruct getStructProperty();
    public native void setStructProperty(@Nullable final Nullable.SomeStruct value);
    @Nullable
    public native Nullable.SomeEnum getEnumProperty();
    public native void setEnumProperty(@Nullable final Nullable.SomeEnum value);
    @Nullable
    public native List<String> getArrayProperty();
    public native void setArrayProperty(@Nullable final List<String> value);
    @Nullable
    public native List<String> getInlineArrayProperty();
    public native void setInlineArrayProperty(@Nullable final List<String> value);
    @Nullable
    public native Map<Long, String> getMapProperty();
    public native void setMapProperty(@Nullable final Map<Long, String> value);
    @Nullable
    public native SomeInterface getInstanceProperty();
    public native void setInstanceProperty(@Nullable final SomeInterface value);
}
