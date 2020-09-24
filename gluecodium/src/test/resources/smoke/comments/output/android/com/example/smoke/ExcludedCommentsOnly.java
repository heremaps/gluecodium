/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * @exclude
 */
public final class ExcludedCommentsOnly extends NativeBase {
    /**
     * @exclude
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * @exclude
     */
    public enum SomeEnum {
        /**
         * @exclude
         */
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * @exclude
     */
    public static final class SomethingWrongException extends Exception {
        public SomethingWrongException(final ExcludedCommentsOnly.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final ExcludedCommentsOnly.SomeEnum error;
    }
    /**
     * @exclude
     */
    static class SomeLambdaImpl extends NativeBase implements SomeLambda {
        protected SomeLambdaImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        /**
         *
         * @exclude
         * @param p0
         * @param index
         * @return
         */
        public native double doIt(@NonNull final String p0, final int index);
    }
    /**
     * @exclude
     */
    public static final class SomeStruct {
        /**
         * @exclude
         */
        public boolean someField;
        public SomeStruct(final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * @exclude
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         *
         * @exclude
         * @param p0
         * @param index
         * @return
         */
        double doIt(@NonNull final String p0, final int index);
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected ExcludedCommentsOnly(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     *
     * @exclude
     * @param inputParameter
     * @return
     * @throws ExcludedCommentsOnly.SomethingWrongException
     */
    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws ExcludedCommentsOnly.SomethingWrongException;
    /**
     *
     * @exclude
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     *
     * @exclude
     */
    public native boolean isSomeProperty();
    /**
     *
     * @exclude
     * @param value
     */
    public native void setSomeProperty(final boolean value);
}
