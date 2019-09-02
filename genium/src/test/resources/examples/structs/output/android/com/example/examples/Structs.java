/*
 *

 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class Structs extends NativeBase {
    public final static class SyncResult {
        public final long lastUpdatedTimeStamp;
        public final long numberOfChanges;
        public SyncResult(final long lastUpdatedTimeStamp, final long numberOfChanges) {
            this.lastUpdatedTimeStamp = lastUpdatedTimeStamp;
            this.numberOfChanges = numberOfChanges;
        }
    }
    public final static class IdentifiableSyncResult {
        public int id;
        @NonNull
        public Structs.SyncResult syncResult;
        public IdentifiableSyncResult(final int id, @NonNull final Structs.SyncResult syncResult) {
            this.id = id;
            this.syncResult = syncResult;
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
