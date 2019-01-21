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
        public SomeStruct() {
            this("");
        }
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
        public Long intField;
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
        public NullableStruct() {
            this((String)null, (Boolean)null, (Double)null, (Long)null, (Nullable.SomeStruct)null, (Nullable.SomeEnum)null, (List<String>)null, (List<String>)null, (Map<Long, String>)null);
        }
        public NullableStruct(String stringField, Boolean boolField, Double doubleField, Long intField, Nullable.SomeStruct structField, Nullable.SomeEnum enumField, List<String> arrayField, List<String> inlineArrayField, Map<Long, String> mapField) {
            this.stringField = stringField;
            this.boolField = boolField;
            this.doubleField = doubleField;
            this.intField = intField;
            this.structField = structField;
            this.enumField = enumField;
            this.arrayField = arrayField;
            this.inlineArrayField = inlineArrayField;
            this.mapField = mapField;
        }
        public static class Builder {
            private String stringField = (String)null;
            private Boolean boolField = (Boolean)null;
            private Double doubleField = (Double)null;
            private Long intField = (Long)null;
            private Nullable.SomeStruct structField = (Nullable.SomeStruct)null;
            private Nullable.SomeEnum enumField = (Nullable.SomeEnum)null;
            private List<String> arrayField = (List<String>)null;
            private List<String> inlineArrayField = (List<String>)null;
            private Map<Long, String> mapField = (Map<Long, String>)null;
            public Builder() {
            }
            public Builder setStringField(String stringField) {
                this.stringField = stringField;
                return this;
            }
            public Builder setBoolField(Boolean boolField) {
                this.boolField = boolField;
                return this;
            }
            public Builder setDoubleField(Double doubleField) {
                this.doubleField = doubleField;
                return this;
            }
            public Builder setIntField(Long intField) {
                this.intField = intField;
                return this;
            }
            public Builder setStructField(Nullable.SomeStruct structField) {
                this.structField = structField;
                return this;
            }
            public Builder setEnumField(Nullable.SomeEnum enumField) {
                this.enumField = enumField;
                return this;
            }
            public Builder setArrayField(List<String> arrayField) {
                this.arrayField = arrayField;
                return this;
            }
            public Builder setInlineArrayField(List<String> inlineArrayField) {
                this.inlineArrayField = inlineArrayField;
                return this;
            }
            public Builder setMapField(Map<Long, String> mapField) {
                this.mapField = mapField;
                return this;
            }
            public NullableStruct build() {
                return new NullableStruct(stringField, boolField, doubleField, intField, structField, enumField, arrayField, inlineArrayField, mapField);
            }
        }
    }
    /** For internal use only */
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
    public native String getStringAttribute();
    public native void setStringAttribute(@Nullable final String value);
    @Nullable
    public native Boolean getBoolAttribute();
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
}
