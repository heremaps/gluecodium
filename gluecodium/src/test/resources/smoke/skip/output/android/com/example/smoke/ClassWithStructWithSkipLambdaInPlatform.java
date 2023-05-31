/*

 *
 */

package com.example.smoke;

import com.example.NativeBase;

public final class ClassWithStructWithSkipLambdaInPlatform extends NativeBase {
    public static final class SkipLambdaInPlatform {
        public int intField;

        public SkipLambdaInPlatform(final int intField) {
            this.intField = intField;
        }


    }


    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected ClassWithStructWithSkipLambdaInPlatform(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);




}

