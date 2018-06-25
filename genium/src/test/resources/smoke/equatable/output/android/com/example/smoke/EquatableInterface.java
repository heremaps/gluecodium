/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class EquatableInterface extends NativeBase {
    public static class EquatableStruct {
        public int intField;
        public String stringField;
        public EquatableStruct() {}
        public EquatableStruct(int intField, String stringField) {
            this.intField = intField;
            this.stringField = stringField;
        }
        @Override
        public boolean equals(Object obj) {
            if (obj == this) return true;
            if (!(obj instanceof EquatableStruct)) return false;
            final EquatableStruct other = (EquatableStruct) obj;
            return this.intField == other.intField &&
                    java.util.Objects.equals(this.stringField, other.stringField);
        }
        @Override
        public int hashCode() {
            int hash = 7;
            hash = 31 * hash + this.intField;
            hash = 31 * hash + (this.stringField != null ? this.stringField.hashCode() : 0);
            return hash;
        }
    }

    /** For internal use only */
    protected EquatableInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
