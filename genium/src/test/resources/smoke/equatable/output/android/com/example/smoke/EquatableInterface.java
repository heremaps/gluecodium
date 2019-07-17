/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class EquatableInterface extends NativeBase {
    public static class EquatableStruct {
        public int intField;
        public String stringField;
        @NonNull
        public EquatableInterface nestedEquatableInstance;
        @NonNull
        public PointerEquatableInterface nestedPointerEquatableInstance;
        public EquatableStruct(final int intField, final String stringField, @NonNull final EquatableInterface nestedEquatableInstance, @NonNull final PointerEquatableInterface nestedPointerEquatableInstance) {
            this.intField = intField;
            this.stringField = stringField;
            this.nestedEquatableInstance = nestedEquatableInstance;
            this.nestedPointerEquatableInstance = nestedPointerEquatableInstance;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof EquatableStruct)) return false;
            final EquatableStruct other = (EquatableStruct) obj;
            return this.intField == other.intField &&
                    java.util.Objects.equals(this.stringField, other.stringField) &&
                    java.util.Objects.equals(this.nestedEquatableInstance, other.nestedEquatableInstance) &&
                    java.util.Objects.equals(this.nestedPointerEquatableInstance, other.nestedPointerEquatableInstance);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + this.intField;
            hash = 31 * hash + (this.stringField != null ? this.stringField.hashCode() : 0);
            hash = 31 * hash + (this.nestedEquatableInstance != null ? this.nestedEquatableInstance.hashCode() : 0);
            hash = 31 * hash + (this.nestedPointerEquatableInstance != null ? this.nestedPointerEquatableInstance.hashCode() : 0);
            return hash;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected EquatableInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Override
    public native boolean equals(Object rhs);
    @Override
    public native int hashCode();
}