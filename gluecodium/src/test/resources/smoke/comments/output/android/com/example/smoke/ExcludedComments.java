/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;

/**
 * <p>This is some very useful class.
 * @hidden
 */
public final class ExcludedComments extends NativeBase {
    /**
     * <p>This is some very useful constant.
     * @hidden
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.
     * @hidden
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful
         * @hidden
         */
        USELESS(0);
        /**
         * @hidden
         */
        public final int value;

        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful exception.
     * @hidden
     */
    public static final class SomethingWrongException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public SomethingWrongException(final ExcludedComments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final ExcludedComments.SomeEnum error;
    }
    /**
     * <p>This is some very useful struct.
     * @hidden
     */
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is
         * remains to be seen
         * @hidden
         */
        public boolean someField;

        /**
         * <p>This is how easy it is to construct.
         * @param someField <p>How useful this struct is
         * remains to be seen
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
         * <p>This is some very useful lambda that does it.
         * @hidden
         * @param p0 <p>Very useful input parameter
         * @param index <p>Slightly less useful input parameter
         * @return <p>Usefulness of the input
         */



        public native double doIt(@NonNull final String p0, final int index);


    }

    /**
     * <p>This is some very useful lambda that does it.
     * @hidden
     */
    @FunctionalInterface
    public interface SomeLambda {
        /**
         * <p>This is some very useful lambda that does it.
         * @hidden
         * @param p0 <p>Very useful input parameter
         * @param index <p>Slightly less useful input parameter
         * @return <p>Usefulness of the input
         */



        double doIt(@NonNull final String p0, final int index);
    }


    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
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
     * <p>This is some very useful method that measures the usefulness of its input.
     * @hidden
     * @param inputParameter <p>Very useful input parameter
     * @return <p>Usefulness of the input
     * @throws ExcludedComments.SomethingWrongException <p>Sometimes it happens.
     */



    public native boolean someMethodWithAllComments(@NonNull final String inputParameter) throws ExcludedComments.SomethingWrongException;

    /**
     * <p>This is some very useful method that does nothing.
     * @hidden
     */



    public native void someMethodWithoutReturnTypeOrInputParameters();

    /**
     * <p>Gets some very useful property.
     * @hidden
     * @return <p>Some very useful property.
     */



    public native boolean isSomeProperty();

    /**
     * <p>Sets some very useful property.
     * @hidden
     * @param value <p>Some very useful property.
     */



    public native void setSomeProperty(final boolean value);



}

