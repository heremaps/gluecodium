/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public class InstanceWithStruct extends NativeBase {
    public static class InnerStruct {
        public byte value;
        public InnerStruct() {
            this((byte)0);
        }
        public InnerStruct(byte value) {
            this.value = value;
        }
    }
    public static class StructWithInstance {
        @NonNull
        public SimpleInstantiable instance;
        /**
         * <p>This is some very useful field.</p>
         */
        @NonNull
        public SimpleInstantiable instanceWithComment;
        public StructWithInstance() {
            this((SimpleInstantiable)null, (SimpleInstantiable)null);
        }
        public StructWithInstance(SimpleInstantiable instance, SimpleInstantiable instanceWithComment) {
            this.instance = instance;
            this.instanceWithComment = instanceWithComment;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected InstanceWithStruct(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native InstanceWithStruct.InnerStruct innerStructMethod(@NonNull final InstanceWithStruct.InnerStruct inputStruct);
    @NonNull
    public native InstanceWithStruct.StructWithInstance structWithInstanceMethod(@NonNull final InstanceWithStruct.StructWithInstance input);
}