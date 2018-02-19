/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;

import com.example.NativeBase;

public class StructsInheritance extends NativeBase {
    public static class SyncResultInherited extends Structs.SyncResult {
        public int id;
        public SyncResultInherited() {}
        public SyncResultInherited(int id) {
            this.id = id;
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