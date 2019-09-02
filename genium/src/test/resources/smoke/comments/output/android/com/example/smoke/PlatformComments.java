/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class PlatformComments extends NativeBase {
    public enum SomeEnum {
        USELESS(0),
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>An exception when something goes wrong.</p>
     */
    public final static class SomeEnumException extends Exception {
        public SomeEnumException(final PlatformComments.SomeEnum error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final PlatformComments.SomeEnum error;
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected PlatformComments(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>This is some very useless method that makes some coffee.</p>
     */
    public native void doNothing();
    /**
     * <p>Makes some coffee.</p>
     */
    public native void doMagic();
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input <p>Very useful parameter</p>
     * @return <p>Uselessness {@link com.example.smoke.PlatformComments.SomeEnum} of the input</p>
     * @throws PlatformComments.SomeEnumException <p>Sometimes it happens.</p>
     */
    public native boolean someMethodWithAllComments(@NonNull final String input) throws PlatformComments.SomeEnumException;
}
