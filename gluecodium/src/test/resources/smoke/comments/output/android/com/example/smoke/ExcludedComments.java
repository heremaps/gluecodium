/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>This is some very useful class.</p>
 * @hidden
 */
public final class ExcludedComments extends NativeBase {
    /**
     * <p>This is some very useful constant.</p>
     * @hidden
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     * @hidden
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         * @hidden
         */
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful exception.</p>
     * @hidden
     */
    public static final class SomethingWrongException extends Exception {
        public SomethingWrongException(final ExcludedComments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final ExcludedComments.SomeEnum error;
    }
    /**
     * <p>This is some very useful struct.</p>
     * @hidden
     */
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is
         * remains to be seen</p>
         * @hidden
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
         * <p>This is some very useful lambda that does it.</p>
         * @hidden
         * @param p0 <p>Very useful input parameter</p>
         * @param index <p>Slightly less useful input parameter</p>
         * @return <p>Usefulness of the input</p>
         */
        public native double doIt(@NonNull final String p0, final int index);
    }
    /**
     * <p>This is some very useful lambda that does it.</p>
     * @hidden
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         * <p>This is some very useful lambda that does it.</p>
         * @hidden
         * @param p0 <p>Very useful input parameter</p>
         * @param index <p>Slightly less useful input parameter</p>
         * @return <p>Usefulness of the input</p>
         */
        double doIt(@NonNull final String p0, final int index);
    }
    /**
     * For internal use only.
     * @hidden
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
     * @hidden
     * @param inputParameter <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     * @throws ExcludedComments.SomethingWrongException <p>Sometimes it happens.</p>
     */
    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws ExcludedComments.SomethingWrongException;
    /**
     * <p>This is some very useful method that does nothing.</p>
     * @hidden
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * <p>Gets some very useful property.</p>
     * @hidden
     */
    public native boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.</p>
     * @hidden
     * @param value <p>Some very useful property.</p>
     */
    public native void setSomeProperty(final boolean value);
}
