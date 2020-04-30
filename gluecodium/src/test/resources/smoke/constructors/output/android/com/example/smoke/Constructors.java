/*
 *
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
    public final static class ConstructorExplodedException extends Exception {
        public ConstructorExplodedException(final Constructors.ErrorEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final Constructors.ErrorEnum error;
    }
    public Constructors() {
        this(create());
        cacheThisInstance();
    }
    public Constructors(@NonNull final Constructors other) {
        this(create(other));
        cacheThisInstance();
    }
    public Constructors(@NonNull final String foo, final long bar) {
        this(create(foo, bar));
        cacheThisInstance();
    }
    public Constructors(@NonNull final String input) throws Constructors.ConstructorExplodedException {
        this(create(input));
        cacheThisInstance();
    }
    public Constructors(@NonNull final List<Double> input) {
        this(create(input));
        cacheThisInstance();
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
    private native void cacheThisInstance();
    private static native long create();
    private static native long create(@NonNull final Constructors other);
    private static native long create(@NonNull final String foo, final long bar);
    private static native long create(@NonNull final String input) throws Constructors.ConstructorExplodedException;
    private static native long create(@NonNull final List<Double> input);
}
