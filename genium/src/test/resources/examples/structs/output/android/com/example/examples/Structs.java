/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import com.example.NativeBase;

public class Structs extends NativeBase {

    public static class SyncResult {
        public final long lastUpdatedTimeStamp;
        public final long numberOfChanges;

        public SyncResult() {
            this(0L, 0L);
        }

        public SyncResult(long lastUpdatedTimeStamp, long numberOfChanges) {
            this.lastUpdatedTimeStamp = lastUpdatedTimeStamp;
            this.numberOfChanges = numberOfChanges;
        }
    }

    public static class IdentifiableSyncResult {
        public int id;
        public Structs.SyncResult syncResult;

        public IdentifiableSyncResult() {
            this(0, new Structs.SyncResult());
        }

        public IdentifiableSyncResult(int id, Structs.SyncResult syncResult) {
            this.id = id;
            this.syncResult = syncResult;
        }
    }

    /** For internal use only */
    protected Structs(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);

    public static native Structs.SyncResult methodWithNonNestedType(final Structs.SyncResult input);
    public static native Structs.IdentifiableSyncResult methodWithNestedType(final Structs.IdentifiableSyncResult input);
}
