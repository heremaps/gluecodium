/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

import com.example.NativeBase;

public class InstanceWithStruct extends NativeBase {
    public static class InnerStruct {
        public byte value;
        public InnerStruct() {}
        public InnerStruct(byte value) {
            this.value = value;
        }
    }
    public static class StructWithInstance {
        public SimpleInstantiableOne instance;
        public SimpleInstantiableOne instanceNotNull;
        public StructWithInstance() {}
        public StructWithInstance(SimpleInstantiableOne instance, SimpleInstantiableOne instanceNotNull) {
            this.instance = instance;
            this.instanceNotNull = instanceNotNull;
        }
    }
    /** For internal use only */
    protected InstanceWithStruct(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native InstanceWithStruct.InnerStruct innerStructMethod(final InstanceWithStruct.InnerStruct inputStruct);
    public native InstanceWithStruct.StructWithInstance structWithInstanceMethod(final InstanceWithStruct.StructWithInstance input);
}
