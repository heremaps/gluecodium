/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Enums extends NativeBase {
    public enum ExternalEnum {
        FOO_VALUE(0),
        BAR_VALUE(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public enum VeryExternalEnum {
        FOO(0),
        BAR(1);
        public final int value;
        VeryExternalEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Enums(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native void methodWithExternalEnum(@NonNull final Enums.ExternalEnum input);
}
