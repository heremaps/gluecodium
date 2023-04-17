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
    public static final class StructWithDefaults {
        public int intField;
        public long uintField;
        public float floatField;
        public double doubleField;
        public boolean boolField;
        @NonNull
        public String stringField;
        public StructWithDefaults() {
            this.intField = 42;
            this.uintField = 4294967295L;
            this.floatField = 3.14f;
            this.doubleField = -1.4142;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
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
        public NullableStructWithDefaults() {
            this.intField = null;
            this.uintField = null;
            this.floatField = null;
            this.boolField = null;
            this.stringField = null;
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
    }
    public static final class StructWithTypedefDefaults {
        public long longField;
        public boolean boolField;
        @NonNull
        public String stringField;
        public StructWithTypedefDefaults() {
            this.longField = 42L;
            this.boolField = true;
            this.stringField = "\\Jonny \"Magic\" Smith\n";
        }
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
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
