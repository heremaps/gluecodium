/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class DefaultValues extends NativeBase {
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
    public static final class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public double doubleField;
        public boolean boolField;
        @NonNull
        public String stringField;
        @NonNull
        public DefaultValues.SomeEnum enumField;
        @NonNull
        public DefaultValues.ExternalEnum externalEnumField;
        public StructWithDefaults() {
            this.intField = 42;
            this.uintField = 4294967295L;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
            this.enumField = DefaultValues.SomeEnum.BAR_VALUE;
            this.externalEnumField = DefaultValues.ExternalEnum.ANOTHER_VALUE;
        }
        public StructWithDefaults(final int intField, final long uintField, final float floatField, final double doubleField, final boolean boolField, @NonNull final String stringField, @NonNull final DefaultValues.SomeEnum enumField, @NonNull final DefaultValues.ExternalEnum externalEnumField) {
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
    public static final class NullableStructWithDefaults {
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
            this.intField = null;
            this.uintField = null;
            this.floatField = null;
            this.boolField = null;
            this.stringField = null;
            this.enumField = null;
        }
        public NullableStructWithDefaults(@Nullable final Integer intField, @Nullable final Long uintField, @Nullable final Float floatField, @Nullable final Boolean boolField, @Nullable final String stringField, @Nullable final DefaultValues.SomeEnum enumField) {
            this.intField = intField;
            this.uintField = uintField;
            this.floatField = floatField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
    }
    public static final class StructWithSpecialDefaults {
        public float floatNanField;
        public float floatInfinityField;
        public float floatNegativeInfinityField;
        public double doubleNanField;
        public double doubleInfinityField;
        public double doubleNegativeInfinityField;
        public StructWithSpecialDefaults() {
            this.floatNanField = Float.NaN;
            this.floatInfinityField = Float.POSITIVE_INFINITY;
            this.floatNegativeInfinityField = Float.NEGATIVE_INFINITY;
            this.doubleNanField = Double.NaN;
            this.doubleInfinityField = Double.POSITIVE_INFINITY;
            this.doubleNegativeInfinityField = Double.NEGATIVE_INFINITY;
        }
        public StructWithSpecialDefaults(final float floatNanField, final float floatInfinityField, final float floatNegativeInfinityField, final double doubleNanField, final double doubleInfinityField, final double doubleNegativeInfinityField) {
            this.floatNanField = floatNanField;
            this.floatInfinityField = floatInfinityField;
            this.floatNegativeInfinityField = floatNegativeInfinityField;
            this.doubleNanField = doubleNanField;
            this.doubleInfinityField = doubleInfinityField;
            this.doubleNegativeInfinityField = doubleNegativeInfinityField;
        }
    }
    public static final class StructWithEmptyDefaults {
        @NonNull
        public List<Integer> intsField;
        @NonNull
        public List<Float> floatsField;
        @NonNull
        public Map<Long, String> mapField;
        @NonNull
        public DefaultValues.StructWithDefaults structField;
        @NonNull
        public Set<String> setTypeField;
        public StructWithEmptyDefaults() {
            this.intsField = new ArrayList<>();
            this.floatsField = new ArrayList<>();
            this.mapField = new HashMap<>();
            this.structField = new DefaultValues.StructWithDefaults();
            this.setTypeField = new HashSet<>();
        }
        public StructWithEmptyDefaults(@NonNull final List<Integer> intsField, @NonNull final List<Float> floatsField, @NonNull final Map<Long, String> mapField, @NonNull final DefaultValues.StructWithDefaults structField, @NonNull final Set<String> setTypeField) {
            this.intsField = intsField;
            this.floatsField = floatsField;
            this.mapField = mapField;
            this.structField = structField;
            this.setTypeField = setTypeField;
        }
    }
    public static final class StructWithTypedefDefaults {
        public long longField;
        public boolean boolField;
        @NonNull
        public String stringField;
        @NonNull
        public DefaultValues.SomeEnum enumField;
        public StructWithTypedefDefaults() {
            this.longField = 42L;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
            this.enumField = DefaultValues.SomeEnum.BAR_VALUE;
        }
        public StructWithTypedefDefaults(final long longField, final boolean boolField, @NonNull final String stringField, @NonNull final DefaultValues.SomeEnum enumField) {
            this.longField = longField;
            this.boolField = boolField;
            this.stringField = stringField;
            this.enumField = enumField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected DefaultValues(final long nativeHandle, final Object dummy) {
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