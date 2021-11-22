/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * @hidden
 */
public final class ExcludedCommentsOnly extends NativeBase {
    /**
     * @hidden
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * @hidden
     */
    public enum SomeEnum {
        /**
         * @hidden
         */
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * @hidden
     */
    public static final class SomethingWrongException extends Exception {
        public SomethingWrongException(final ExcludedCommentsOnly.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final ExcludedCommentsOnly.SomeEnum error;
    }
    /**
     * @hidden
     */
    public static final class SomeStruct {
        /**
         * @hidden
         */
        public boolean someField;
        public SomeStruct(final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * @hidden
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
         * @hidden
         * @param p0
         * @param index
         * @return
         */
        public native double doIt(@NonNull final String p0, final int index);
    }
    /**
     * @hidden
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         *
         * @hidden
         * @param p0
         * @param index
         * @return
         */
        double doIt(@NonNull final String p0, final int index);
    }
    /**
     * For internal use only.
     * @hidden
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
     * @hidden
     * @param inputParameter
     * @return
     * @throws ExcludedCommentsOnly.SomethingWrongException
     */
    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws ExcludedCommentsOnly.SomethingWrongException;
    /**
     *
     * @hidden
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     *
     * @hidden
     */
    public native boolean isSomeProperty();
    /**
     *
     * @hidden
     * @param value
     */
    public native void setSomeProperty(final boolean value);
}
