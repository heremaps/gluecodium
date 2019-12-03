/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
public final class Lambdas extends NativeBase {
    static class ProducerImpl extends NativeBase implements Producer {
        protected ProducerImpl(final long nativeHandle) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native String apply();
    }
    static class ConfounderImpl extends NativeBase implements Confounder {
        protected ConfounderImpl(final long nativeHandle) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native Lambdas.Producer confuse(@NonNull final String p0);
    }
    static class ConsumerImpl extends NativeBase implements Consumer {
        protected ConsumerImpl(final long nativeHandle) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        public native void apply(@NonNull final String p0);
    }
    static class IndexerImpl extends NativeBase implements Indexer {
        protected IndexerImpl(final long nativeHandle) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        public native int apply(@NonNull final String p0, final float index);
    }
    static class NullableConfuserImpl extends NativeBase implements NullableConfuser {
        protected NullableConfuserImpl(final long nativeHandle) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @Nullable
        public native Lambdas.Producer apply(@Nullable final String p0);
    }
    @FunctionalInterface
    public interface Producer {
        @NonNull
        String apply();
    }
    /**
     * Should confuse everyone thoroughly
     */
    @FunctionalInterface
    public interface Confounder {
        @NonNull
        Lambdas.Producer confuse(@NonNull final String p0);
    }
    @FunctionalInterface
    public interface Consumer {
        void apply(@NonNull final String p0);
    }
    @FunctionalInterface
    public interface Indexer {
        int apply(@NonNull final String p0, final float index);
    }
    @FunctionalInterface
    public interface NullableConfuser {
        @Nullable
        Lambdas.Producer apply(@Nullable final String p0);
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected Lambdas(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native Lambdas.Producer deconfuse(@NonNull final String value, @NonNull final Lambdas.Confounder confuser);
    @NonNull
    public static native Map<Integer, String> fuse(@NonNull final List<String> items, @NonNull final Lambdas.Indexer callback);
}
