/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Structs extends NativeBase {
    public static final class ExternalStruct {
        @NonNull
        public String stringField;
        @NonNull
        public String externalStringField;
        @NonNull
        public List<Byte> externalArrayField;
        @NonNull
        public Structs.AnotherExternalStruct externalStructField;
        public ExternalStruct(@NonNull final String stringField, @NonNull final String externalStringField, @NonNull final List<Byte> externalArrayField, @NonNull final Structs.AnotherExternalStruct externalStructField) {
            this.stringField = stringField;
            this.externalStringField = externalStringField;
            this.externalArrayField = externalArrayField;
            this.externalStructField = externalStructField;
        }
    }
    public static final class AnotherExternalStruct {
        public byte intField;
        public AnotherExternalStruct(final byte intField) {
            this.intField = intField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Structs(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Structs.ExternalStruct getExternalStruct();
    @NonNull
    public static native Structs.AnotherExternalStruct getAnotherExternalStruct();
}
