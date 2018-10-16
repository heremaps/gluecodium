/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import com.example.NativeBase;

public class StructsInheritance extends NativeBase {
    public static class SyncResultInherited extends Structs.SyncResult {
        public int id;
        public SyncResultInherited() {
            this(0L, 0L, 0);
        }
        public SyncResultInherited(long lastUpdatedTimeStamp, long numberOfChanges, int id) {
            super(lastUpdatedTimeStamp, numberOfChanges);
            this.id = id;
        }
        public static class Builder {
            private long lastUpdatedTimeStamp = 0L;
            private long numberOfChanges = 0L;
            private int id = 0;
            public Builder() {
            }
            public Builder setLastUpdatedTimeStamp(long lastUpdatedTimeStamp) {
                this.lastUpdatedTimeStamp = lastUpdatedTimeStamp;
                return this;
            }
            public Builder setNumberOfChanges(long numberOfChanges) {
                this.numberOfChanges = numberOfChanges;
                return this;
            }
            public Builder setId(int id) {
                this.id = id;
                return this;
            }
            public SyncResultInherited build() {
                return new SyncResultInherited(lastUpdatedTimeStamp, numberOfChanges, id);
            }
        }
    }
    /** For internal use only */
    protected StructsInheritance(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    public native StructsInheritance.SyncResultInherited methodWithInheritedType(final StructsInheritance.SyncResultInherited input);
}