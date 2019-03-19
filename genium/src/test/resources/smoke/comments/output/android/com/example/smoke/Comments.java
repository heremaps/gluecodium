/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * This is some very useful interface.
 */
public class Comments extends NativeBase {
    /**
     * This is some very useful constant.
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * This is some very useful enum.
     */
    public enum SomeEnum {
        /**
         * Not quite useful
         */
        USELESS(0),
        /**
         * Somewhat useful
         */
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public static class SomeEnumException extends Exception {
        SomeEnumException(final Comments.SomeEnum error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final Comments.SomeEnum error;
    }
    /**
     * This is some very useful struct.
     */
    public static class SomeStruct {
        /**
         * How useful this struct is
         */
        public boolean someField;
        public SomeStruct() {
            this(false);
        }
        public SomeStruct(boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Comments(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     * @throws Comments.SomeEnumException
     */
    public native boolean someMethodWithAllComments(final String input) throws Comments.SomeEnumException;
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     */
    public native boolean someMethodWithInputComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @return Usefulness of the input
     */
    public native boolean someMethodWithOutputComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of its input.
     */
    public native boolean someMethodWithNoComments(final String input);
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input Very useful input parameter
     */
    public native void someMethodWithoutReturnTypeWithAllComments(final String input);
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     */
    public native void someMethodWithoutReturnTypeWithNoComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return Usefulness of the input
     */
    public native boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * This is some very useful method that measures the usefulness of something.
     */
    public native boolean someMethodWithoutInputParametersWithNoComments();
    public native void someMethodWithNothing();
    /**
     * This is some very useful method that does nothing.
     */
    public native void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * This is some very useful instance method.
     * @param input This is some very useful instance method parameter.
     * @return This is some very useful instance method result.
     */
    @NonNull
    public native CommentsInstantiable instanceMethod(@NonNull final CommentsInstantiable input);
    /**
     * This is some very useful attribute.
     */
    public native boolean isSomeAttribute();
    /**
     * This is some very useful attribute.
     */
    public native void setSomeAttribute(final boolean value);
    /**
     * This is some very useful attribute.
     */
    @NonNull
    public native CommentsInstantiable getInstanceAttribute();
    /**
     * This is some very useful attribute.
     */
    public native void setInstanceAttribute(@NonNull final CommentsInstantiable value);
}
