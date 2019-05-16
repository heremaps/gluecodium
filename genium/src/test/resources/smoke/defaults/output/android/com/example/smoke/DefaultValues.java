/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class DefaultValues extends NativeBase {
    public enum SomeEnum {
        FOO_VALUE(0),
        BAR_VALUE(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public enum ExternalEnum {
        ONE_VALUE(0),
        ANOTHER_VALUE(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public static class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public double doubleField;
        public boolean boolField;
        public String stringField;
        @NonNull
        public DefaultValues.SomeEnum enumField;
        @NonNull
        public DefaultValues.ExternalEnum externalEnumField;
        public StructWithDefaults() {
            this(42, 4294967295L, 3.14f, -1.4142, true, "\\Jonny \"Magic\" Smith\n", DefaultValues.SomeEnum.BAR_VALUE, DefaultValues.ExternalEnum.ANOTHER_VALUE);
        }
        public StructWithDefaults(int intField, long uintField, float floatField, double doubleField, boolean boolField, String stringField, DefaultValues.SomeEnum enumField, DefaultValues.ExternalEnum externalEnumField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
            this.externalEnumField = externalEnumField;
        }
    }
    public static class NullableStructWithDefaults {
        @Nullable
        public Integer intField;
        @Nullable
        public Long uintField;
        @Nullable
        public Float floatField;
        @Nullable
        public Boolean boolField;
        @Nullable
        public String stringField;
        @Nullable
        public DefaultValues.SomeEnum enumField;
        public NullableStructWithDefaults() {
            this(null, null, null, null, null, null);
        }
        public NullableStructWithDefaults(Integer intField, Long uintField, Float floatField, Boolean boolField, String stringField, DefaultValues.SomeEnum enumField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
    }
    public static class StructWithSpecialDefaults {
        public float floatNanField;
        public float floatInfinityField;
        public float floatNegativeInfinityField;
        public double doubleNanField;
        public double doubleInfinityField;
        public double doubleNegativeInfinityField;
        public StructWithSpecialDefaults() {
            this(Float.NaN, Float.POSITIVE_INFINITY, Float.NEGATIVE_INFINITY, Double.NaN, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY);
        }
        public StructWithSpecialDefaults(float floatNanField, float floatInfinityField, float floatNegativeInfinityField, double doubleNanField, double doubleInfinityField, double doubleNegativeInfinityField) {
            this.floatNanField = floatNanField;
            this.floatInfinityField = floatInfinityField;
            this.floatNegativeInfinityField = floatNegativeInfinityField;
            this.doubleNanField = doubleNanField;
            this.doubleInfinityField = doubleInfinityField;
            this.doubleNegativeInfinityField = doubleNegativeInfinityField;
        }
    }
    public static class StructWithCollectionsDefaults {
        @NonNull
        public List<Integer> intsField;
        @NonNull
        public List<Float> floatsField;
        @NonNull
        public Map<Long, String> mapField;
        public StructWithCollectionsDefaults() {
            this(new ArrayList<>(), new ArrayList<>(), new HashMap<>());
        }
        public StructWithCollectionsDefaults(List<Integer> intsField, List<Float> floatsField, Map<Long, String> mapField) {
            this.intsField = intsField;
            this.floatsField = floatsField;
            this.mapField = mapField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected DefaultValues(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native DefaultValues.StructWithDefaults processStructWithDefaults(@NonNull final DefaultValues.StructWithDefaults input);
}
