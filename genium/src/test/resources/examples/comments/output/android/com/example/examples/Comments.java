/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.examples;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>This is some very useful interface.</p>
 */
public class Comments extends NativeBase {
    /**
     * <p>This is some very useful constant.</p>
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         */
        USELESS(0),
        /**
         * <p>Somewhat useful</p>
         */
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful struct.</p>
     */
    public static class SomeStruct {
        /**
         * <p>How useful this struct is</p>
         */
        public boolean someField;
        public SomeStruct(final boolean someField) {
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
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     */
    public native boolean someMethod(@NonNull final String input);
    /**
     * <p>Gets some very useful attribute.</p>
     */
    public native boolean isSomeAttribute();
    /**
     * <p>Sets some very useful attribute.</p>
     * @param value Some very useful attribute.
     */
    public native void setSomeAttribute(final boolean value);
}
