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
        public InnerStruct() {}
        public InnerStruct(byte value) {
            this.value = value;
        }
    }
    public static class StructWithInstance {
        public SimpleInstantiableOne instance;
        /** @nonNull */
        @NonNull
        public SimpleInstantiableOne instanceNotNull;
        /**
         * This is some very useful field.
         * @nonNull
         */
        @NonNull
        public SimpleInstantiableOne instanceNotNullWithComment;
        public StructWithInstance() {}
        public StructWithInstance(SimpleInstantiableOne instance, SimpleInstantiableOne instanceNotNull, SimpleInstantiableOne instanceNotNullWithComment) {
            this.instance = instance;
            this.instanceNotNull = instanceNotNull;
            this.instanceNotNullWithComment = instanceNotNullWithComment;
        }
        public static class Builder {
            private SimpleInstantiableOne instance;
            private SimpleInstantiableOne instanceNotNull;
            private SimpleInstantiableOne instanceNotNullWithComment;
            public Builder() {
            }
            public Builder setInstance(SimpleInstantiableOne instance) {
                this.instance = instance;
                return this;
            }
            public Builder setInstanceNotNull(SimpleInstantiableOne instanceNotNull) {
                this.instanceNotNull = instanceNotNull;
                return this;
            }
            public Builder setInstanceNotNullWithComment(SimpleInstantiableOne instanceNotNullWithComment) {
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
    public native InstanceWithStruct.InnerStruct innerStructMethod(final InstanceWithStruct.InnerStruct inputStruct);
    public native InstanceWithStruct.StructWithInstance structWithInstanceMethod(final InstanceWithStruct.StructWithInstance input);
}
