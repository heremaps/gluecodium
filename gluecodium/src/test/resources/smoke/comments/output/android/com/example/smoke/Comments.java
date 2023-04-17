/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
/**
 * <p>This is some very useful interface.
 */
public final class Comments extends NativeBase {
    /**
     * <p>This is some very useful constant.
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful
         */
        USELESS(0),
        /**
         * <p>Somewhat useful
         */
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful exception.
     */
    public static final class SomethingWrongException extends Exception {
        public SomethingWrongException(final Comments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final Comments.SomeEnum error;
    }
    /**
     * <p>This is some very useful struct.
     */
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is
         * remains to be seen
         */
        public boolean someField;
        /**
         * <p>Can be <code>null</code>
         */
        @Nullable
        public String nullableField;
        /**
         * <p>This is how easy it is to construct.
         * @param someField <p>How useful this struct is
         * remains to be seen
         */
        public SomeStruct(final boolean someField) {
            this.someField = someField;
            this.nullableField = null;
        }
        /**
         * <p>This is some struct method that does nothing.
         */
        public native void someStructMethod();
        /**
         * <p>This is some static struct method that does nothing.
         */
        public static native void someStaticStructMethod();
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
         * <p>This is some very useful lambda that does it.
         * @param p0 <p>Very useful input parameter
         * @param index <p>Slightly less useful input parameter
         * @return <p>Usefulness of the input
         */
        public native double doIt(@NonNull final String p0, final int index);
    }
    /**
     * <p>This is some very useful lambda that does it.
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         * <p>This is some very useful lambda that does it.
         * @param p0 <p>Very useful input parameter
         * @param index <p>Slightly less useful input parameter
         * @return <p>Usefulness of the input
         */
        double doIt(@NonNull final String p0, final int index);
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Comments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param inputParameter <p>Very useful input parameter
     * @return <p>Usefulness of the input
     * @throws Comments.SomethingWrongException <p>Sometimes it happens.
     */
    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws Comments.SomethingWrongException;
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input <p>Very useful input parameter
     * @return
     */
    public native boolean someMethodWithInputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return <p>Usefulness of the input
     */
    public native boolean someMethodWithOutputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return
     */
    public native boolean someMethodWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.
     * @param input <p>Very useful input parameter
     */
    public native void someMethodWithoutReturnTypeWithAllComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.
     * @param input
     */
    public native void someMethodWithoutReturnTypeWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of something.
     * @return <p>Usefulness of the input
     */
    public native boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * <p>This is some very useful method that measures the usefulness of something.
     * @return
     */
    public native boolean someMethodWithoutInputParametersWithNoComments();
    public native void someMethodWithNothing();
    /**
     * <p>This is some very useful method that does nothing.
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     *
     * @param undocumented
     * @param documented <p>nicely documented
     * @return
     */
    @NonNull
    public native String oneParameterCommentOnly(@NonNull final String undocumented, @NonNull final String documented);
    /**
     *
     * @param undocumented
     * @return <p>nicely documented
     */
    @NonNull
    public native String returnCommentOnly(@NonNull final String undocumented);
    /**
     * <p>Gets some very useful property.
     */
    public native boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.
     * @param value <p>Some very useful property.
     */
    public native void setSomeProperty(final boolean value);
}
