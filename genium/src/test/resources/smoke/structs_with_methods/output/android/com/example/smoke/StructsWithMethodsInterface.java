/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class StructsWithMethodsInterface extends NativeBase {
    public static class Vector3 {
        public double x;
        public double y;
        public double z;
        public Vector3() {
            this(0, 0, 0);
        }
        public Vector3(double x, double y, double z) {
            this.x = x;
            this.y = y;
            this.z = z;
        }
        public static class Builder {
            private double x = 0;
            private double y = 0;
            private double z = 0;
            public Builder() {
            }
            public Builder setX(double x) {
                this.x = x;
                return this;
            }
            public Builder setY(double y) {
                this.y = y;
                return this;
            }
            public Builder setZ(double z) {
                this.z = z;
                return this;
            }
            public Vector3 build() {
                return new Vector3(x, y, z);
            }
        }
        public native double distanceTo(@NonNull final StructsWithMethodsInterface.Vector3 other);
        @NonNull
        public native StructsWithMethodsInterface.Vector3 add(@NonNull final StructsWithMethodsInterface.Vector3 other);
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected StructsWithMethodsInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
