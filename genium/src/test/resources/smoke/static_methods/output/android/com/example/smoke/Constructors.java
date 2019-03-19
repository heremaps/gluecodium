/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public class Constructors extends NativeBase {
    public enum ErrorEnum {
        NONE(0),
        CRASHED(1);
        public final int value;
        ErrorEnum(final int value) {
            this.value = value;
        }
    }
    public static class ErrorEnumException extends Exception {
        ErrorEnumException(final Constructors.ErrorEnum error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final Constructors.ErrorEnum error;
    }
    public Constructors() {
        this(create());
    }
    public Constructors(@NonNull final Constructors other) {
        this(create(other));
    }
    public Constructors(final String foo, final long bar) {
        this(create(foo, bar));
    }
    public Constructors(final String input) throws Constructors.ErrorEnumException {
        this(create(input));
    }
    public Constructors(@NonNull final List<Double> input) {
        this(create(input));
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Constructors(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    private static native long create();
    private static native long create(@NonNull final Constructors other);
    private static native long create(final String foo, final long bar);
    private static native long create(final String input) throws Constructors.ErrorEnumException;
    private static native long create(@NonNull final List<Double> input);
}
