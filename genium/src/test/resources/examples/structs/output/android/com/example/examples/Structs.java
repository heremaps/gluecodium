/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import android.support.annotation.NonNull;
import com.example.NativeBase;

public class Structs extends NativeBase {

    public static class SyncResult {
        public long lastUpdatedTimeStamp;
        public long numberOfChanges;

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
        @NonNull
        public Structs.SyncResult syncResult;

        public IdentifiableSyncResult() {
            this(0, new Structs.SyncResult());
        }

        public IdentifiableSyncResult(int id, Structs.SyncResult syncResult) {
            this.id = id;
            this.syncResult = syncResult;
        }
    }

    public static class ImmutableSyncResult {
        public final long lastUpdatedTimeStamp;
        public final long numberOfChanges;
        public ImmutableSyncResult() {
            this(0L, 0L);
        }
        public ImmutableSyncResult(long lastUpdatedTimeStamp, long numberOfChanges) {
            this.lastUpdatedTimeStamp = lastUpdatedTimeStamp;
            this.numberOfChanges = numberOfChanges;
        }
    }

    /**
     * For internal use only.
     * @exclude
     */
    protected Structs(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);

    @NonNull
    public static native Structs.SyncResult methodWithNonNestedType(@NonNull final Structs.SyncResult input);
    @NonNull
    public static native Structs.IdentifiableSyncResult methodWithNestedType(@NonNull final Structs.IdentifiableSyncResult input);
}
