/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
public class Nullable extends NativeBase {
    public enum SomeEnum {
        ON(0),
        OFF(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static class SomeStruct {
        public String stringField;
        public SomeStruct(String stringField) {
            this.stringField = stringField;
        }
    }
    public static class NullableStruct {
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
        public NullableStruct(String stringField, Boolean boolField, Double doubleField, Nullable.SomeStruct structField, Nullable.SomeEnum enumField, List<String> arrayField, List<String> inlineArrayField, Map<Long, String> mapField, SomeInterface instanceField) {
            this.stringField = stringField;
            this.boolField = boolField;
            this.doubleField = doubleField;
            this.structField = structField;
            this.enumField = enumField;
            this.arrayField = arrayField;
            this.inlineArrayField = inlineArrayField;
            this.mapField = mapField;
            this.instanceField = instanceField;
        }
    }
    public static class NullableIntsStruct {
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
        public NullableIntsStruct(Byte int8Field, Short int16Field, Integer int32Field, Long int64Field, Short uint8Field, Integer uint16Field, Long uint32Field, Long uint64Field) {
            this.int8Field = int8Field;
            this.int16Field = int16Field;
            this.int32Field = int32Field;
            this.int64Field = int64Field;
            this.uint8Field = uint8Field;
            this.uint16Field = uint16Field;
            this.uint32Field = uint32Field;
            this.uint64Field = uint64Field;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Nullable(final long nativeHandle) {
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
    public native String getStringAttribute();
    public native void setStringAttribute(@Nullable final String value);
    @Nullable
    public native Boolean isBoolAttribute();
    public native void setBoolAttribute(@Nullable final Boolean value);
    @Nullable
    public native Double getDoubleAttribute();
    public native void setDoubleAttribute(@Nullable final Double value);
    @Nullable
    public native Long getIntAttribute();
    public native void setIntAttribute(@Nullable final Long value);
    @Nullable
    public native Nullable.SomeStruct getStructAttribute();
    public native void setStructAttribute(@Nullable final Nullable.SomeStruct value);
    @Nullable
    public native Nullable.SomeEnum getEnumAttribute();
    public native void setEnumAttribute(@Nullable final Nullable.SomeEnum value);
    @Nullable
    public native List<String> getArrayAttribute();
    public native void setArrayAttribute(@Nullable final List<String> value);
    @Nullable
    public native List<String> getInlineArrayAttribute();
    public native void setInlineArrayAttribute(@Nullable final List<String> value);
    @Nullable
    public native Map<Long, String> getMapAttribute();
    public native void setMapAttribute(@Nullable final Map<Long, String> value);
    @Nullable
    public native SomeInterface getInstanceAttribute();
    public native void setInstanceAttribute(@Nullable final SomeInterface value);
}