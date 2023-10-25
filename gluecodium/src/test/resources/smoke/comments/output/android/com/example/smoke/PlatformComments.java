/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;

public final class PlatformComments extends NativeBase {
    public enum SomeEnum {
        /**
         * <p>Maybe useful.
         */
        USELESS(0),
        USEFUL(1);
        /**
         * @hidden
         */
        public final int value;

        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>An exception when something goes wrong.
     */
    public static final class SomethingWrongException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public SomethingWrongException(final PlatformComments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final PlatformComments.SomeEnum error;
    }
    /**
     * <p>This is a very super struct.
     */
    public static final class Something {
        @NonNull
        public String nothing;

        public Something(@NonNull final String nothing) {
            this.nothing = nothing;
        }


    }


    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected PlatformComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);


    /**
     * <p>This is some very useless method that makes some coffee.
     */



    public native void doNothing();

    /**
     * <p>Makes some coffee.
     */



    public native void doMagic();

    /**
     * <p>This is some very useful method that measures the usefulness of its input or \esc@pe{s}.
     * @param input <p>Very useful parameter that [\esc@pe{s}]
     * @return <p>Uselessness {@link com.example.smoke.PlatformComments.SomeEnum} of the input
     * @throws PlatformComments.SomethingWrongException <p>Sometimes it happens.
     */



    public native boolean someMethodWithAllComments(@NonNull final String input) throws PlatformComments.SomethingWrongException;

    /**
     *
     * @deprecated <p>A very useless method that is deprecated.
     */
    @Deprecated


    public native void someDeprecatedMethod();



}

