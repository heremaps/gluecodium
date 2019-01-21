/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
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
        @Nullable
        public SimpleInstantiable instance;
        @NonNull
        public SimpleInstantiable instanceNotNull;
        /**
         * This is some very useful field.
         */
        @NonNull
        public SimpleInstantiable instanceNotNullWithComment;
        public StructWithInstance() {
            this((SimpleInstantiable)null, (SimpleInstantiable)null, (SimpleInstantiable)null);
        }
        public StructWithInstance(SimpleInstantiable instance, SimpleInstantiable instanceNotNull, SimpleInstantiable instanceNotNullWithComment) {
            this.instance = instance;
            this.instanceNotNull = instanceNotNull;
            this.instanceNotNullWithComment = instanceNotNullWithComment;
        }
        public static class Builder {
            private SimpleInstantiable instance = (SimpleInstantiable)null;
            private SimpleInstantiable instanceNotNull = (SimpleInstantiable)null;
            private SimpleInstantiable instanceNotNullWithComment = (SimpleInstantiable)null;
            public Builder() {
            }
            public Builder setInstance(SimpleInstantiable instance) {
                this.instance = instance;
                return this;
            }
            public Builder setInstanceNotNull(SimpleInstantiable instanceNotNull) {
                this.instanceNotNull = instanceNotNull;
                return this;
            }
            public Builder setInstanceNotNullWithComment(SimpleInstantiable instanceNotNullWithComment) {
                this.instanceNotNullWithComment = instanceNotNullWithComment;
                return this;
            }
            public StructWithInstance build() {
                return new StructWithInstance(instance, instanceNotNull, instanceNotNullWithComment);
            }
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
    @NonNull
    public native InstanceWithStruct.InnerStruct innerStructMethod(@NonNull final InstanceWithStruct.InnerStruct inputStruct);
    @NonNull
    public native InstanceWithStruct.StructWithInstance structWithInstanceMethod(@NonNull final InstanceWithStruct.StructWithInstance input);
}
