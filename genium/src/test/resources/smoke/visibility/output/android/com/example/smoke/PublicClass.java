/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class PublicClass extends NativeBase {
    enum InternalEnum {
        FOO(0),
        BAR(1);
        final int value;
        InternalEnum(final int value) {
            this.value = value;
        }
    }
    static class InternalStruct {
        String stringField;
        InternalStruct(String stringField) {
            this.stringField = stringField;
        }
    }
    public static class PublicStruct {
        @NonNull
        PublicClass.InternalStruct internalField;
        PublicStruct(PublicClass.InternalStruct internalField) {
            this.internalField = internalField;
        }
    }
    public static class PublicStructWithInternalDefaults {
        String internalField;
        public float publicField;
        public PublicStructWithInternalDefaults(float publicField) {
            this.internalField = "foo";
            this.publicField = publicField;
        }
        PublicStructWithInternalDefaults(String internalField, float publicField) {
            this.internalField = internalField;
            this.publicField = publicField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected PublicClass(final long nativeHandle) {
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
    native PublicClass.InternalStruct getInternalStructAttribute();
    native void setInternalStructAttribute(@NonNull final PublicClass.InternalStruct value);
    public native String getInternalSetterAttribute();
    native void setInternalSetterAttribute(final String value);
}
