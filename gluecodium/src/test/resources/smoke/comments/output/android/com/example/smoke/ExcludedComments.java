/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>This is some very useful class.</p>
 * @exclude
 */
public final class ExcludedComments extends NativeBase {
    /**
     * <p>This is some very useful constant.</p>
     * @exclude
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     * @exclude
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         * @exclude
         */
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful exception.</p>
     * @exclude
     */
    public static final class SomethingWrongException extends Exception {
        public SomethingWrongException(final ExcludedComments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final ExcludedComments.SomeEnum error;
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
         * This is some very useful lambda that does it.
         * @exclude
         * @param p0 Very useful input parameter
         * @param index Slightly less useful input parameter
         * @return Usefulness of the input
         */
        public native double doIt(@NonNull final String p0, final int index);
    }
    /**
     * <p>This is some very useful struct.</p>
     * @exclude
     */
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is
         * remains to be seen</p>
         * @exclude
         */
        public boolean someField;
        /**
         * <p>This is how easy it is to construct.</p>
         * @param someField <p>How useful this struct is
         * remains to be seen</p>
         */
        public SomeStruct(final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * This is some very useful lambda that does it.
     * @exclude
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         * This is some very useful lambda that does it.
         * @exclude
         * @param p0 Very useful input parameter
         * @param index Slightly less useful input parameter
         * @return Usefulness of the input
         */
        double doIt(@NonNull final String p0, final int index);
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected ExcludedComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @exclude
     * @param inputParameter <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     * @throws ExcludedComments.SomethingWrongException <p>Sometimes it happens.</p>
     */
    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws ExcludedComments.SomethingWrongException;
    /**
     * <p>This is some very useful method that does nothing.</p>
     * @exclude
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * <p>Gets some very useful property.</p>
     * @exclude
     */
    public native boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.</p>
     * @exclude
     * @param value Some very useful property.
     */
    public native void setSomeProperty(final boolean value);
}
