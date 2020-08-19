/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class StructsWithMethodsInterface extends NativeBase {
    public static final class Vector3 {
        public double x;
        public double y;
        public double z;
        public Vector3(@NonNull final String input) {
            Vector3 _other = create(input);
            this.x = _other.x;
            this.y = _other.y;
            this.z = _other.z;
        }
        public Vector3(@NonNull final StructsWithMethodsInterface.Vector3 other) throws ValidationException {
            Vector3 _other = create(other);
            this.x = _other.x;
            this.y = _other.y;
            this.z = _other.z;
        }
        public native double distanceTo(@NonNull final StructsWithMethodsInterface.Vector3 other);
        @NonNull
        public native StructsWithMethodsInterface.Vector3 add(@NonNull final StructsWithMethodsInterface.Vector3 other);
        public static native boolean validate(final double x, final double y, final double z);
        private static native StructsWithMethodsInterface.Vector3 create(@NonNull final String input);
        private static native StructsWithMethodsInterface.Vector3 create(@NonNull final StructsWithMethodsInterface.Vector3 other) throws ValidationException;
    }
    public static final class StructWithStaticMethodsOnly {
        public static native void doStuff();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected StructsWithMethodsInterface(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
