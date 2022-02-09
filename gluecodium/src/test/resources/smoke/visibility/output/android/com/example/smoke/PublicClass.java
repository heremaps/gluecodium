/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class PublicClass extends NativeBase {
    enum InternalEnum {
        FOO(0),
        BAR(1);
        final int value;
        InternalEnum(final int value) {
            this.value = value;
        }
    }
    static final class InternalStruct {
        @NonNull
        String stringField;
        InternalStruct(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    public static final class PublicStruct {
        @NonNull
        PublicClass.InternalStruct internalField;
        PublicStruct(@NonNull final PublicClass.InternalStruct internalField) {
            this.internalField = internalField;
        }
    }
    public static final class PublicStructWithInternalDefaults {
        @NonNull
        String internalField;
        public float publicField;
        public PublicStructWithInternalDefaults(final float publicField) {
            this.internalField = "foo";
            this.publicField = publicField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected PublicClass(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    native PublicClass.InternalStruct internalMethod(@NonNull final PublicClass.InternalStruct input);
    @NonNull
    native PublicClass.InternalStruct getInternalStructProperty();
    native void setInternalStructProperty(@NonNull final PublicClass.InternalStruct value);
    @NonNull
    public native String getInternalSetterProperty();
    native void setInternalSetterProperty(@NonNull final String value);
}
