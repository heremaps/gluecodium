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
    public static final class ConstructorExplodedException extends Exception {
        public ConstructorExplodedException(final Constructors.ErrorEnum error) {
            super(error.toString());
            this.error = error;
        }
        public final Constructors.ErrorEnum error;
    }
    public Constructors() {
        this(create(), (Object)null);
        cacheThisInstance();
    }
    public Constructors(@NonNull final Constructors other) {
        this(create(other), (Object)null);
        cacheThisInstance();
    }
    public Constructors(@NonNull final String foo, final long bar) {
        this(create(foo, bar), (Object)null);
        cacheThisInstance();
    }
    public Constructors(@NonNull final String input) throws Constructors.ConstructorExplodedException {
        this(create(input), (Object)null);
        cacheThisInstance();
    }
    public Constructors(@NonNull final List<Double> input) {
        this(create(input), (Object)null);
        cacheThisInstance();
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Constructors(final long nativeHandle, final Object dummy) {
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
