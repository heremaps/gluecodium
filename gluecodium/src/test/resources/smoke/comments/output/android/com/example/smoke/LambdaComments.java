/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class LambdaComments extends NativeBase {
    /**
     * @hidden
     */
    static class WithNoNamedParametersImpl extends NativeBase implements WithNoNamedParameters {
        protected WithNoNamedParametersImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        /**
         * <p>The first line of the doc.
         * @param p0 <p>The first input parameter
         * @return
         */
        @NonNull
        public native String apply(@NonNull final String p0);
    }
    /**
     * @hidden
     */
    static class WithNoDocsForParametersImpl extends NativeBase implements WithNoDocsForParameters {
        protected WithNoDocsForParametersImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        /**
         * <p>The first line of the doc.
         * @param p0
         * @return
         */
        @NonNull
        public native String apply(@NonNull final String p0);
    }
    /**
     * @hidden
     */
    static class WithNamedParametersImpl extends NativeBase implements WithNamedParameters {
        protected WithNamedParametersImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        /**
         * <p>The first line of the doc.
         * @param inputParameter <p>The first input parameter. The second sentence of the first input parameter.
         * @return <p>The string.
         */
        @NonNull
        public native String apply(@NonNull final String inputParameter);
    }
    /**
     * @hidden
     */
    static class MixedDocNameParametersImpl extends NativeBase implements MixedDocNameParameters {
        protected MixedDocNameParametersImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        /**
         * <p>The first line of the doc.
         * @param inputParameter
         * @param secondInputParameter
         * @return <p>The string.
         */
        @NonNull
        public native String apply(@NonNull final String inputParameter, @NonNull final String secondInputParameter);
    }
    /**
     * @hidden
     */
    static class NoCommentsNoNamedParamsImpl extends NativeBase implements NoCommentsNoNamedParams {
        protected NoCommentsNoNamedParamsImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native String apply(@NonNull final String p0, @NonNull final String p1);
    }
    /**
     * @hidden
     */
    static class NoCommentsWithNamedParamsImpl extends NativeBase implements NoCommentsWithNamedParams {
        protected NoCommentsWithNamedParamsImpl(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @NonNull
        public native String apply(@NonNull final String first, @NonNull final String second);
    }
    /**
     * <p>The first line of the doc.
     */
    @FunctionalInterface
    public interface WithNoNamedParameters {
        /**
         * <p>The first line of the doc.
         * @param p0 <p>The first input parameter
         * @return
         */
        @NonNull
        String apply(@NonNull final String p0);
    }
    /**
     * <p>The first line of the doc.
     */
    @FunctionalInterface
    public interface WithNoDocsForParameters {
        /**
         * <p>The first line of the doc.
         * @param p0
         * @return
         */
        @NonNull
        String apply(@NonNull final String p0);
    }
    /**
     * <p>The first line of the doc.
     */
    @FunctionalInterface
    public interface WithNamedParameters {
        /**
         * <p>The first line of the doc.
         * @param inputParameter <p>The first input parameter. The second sentence of the first input parameter.
         * @return <p>The string.
         */
        @NonNull
        String apply(@NonNull final String inputParameter);
    }
    /**
     * <p>The first line of the doc.
     */
    @FunctionalInterface
    public interface MixedDocNameParameters {
        /**
         * <p>The first line of the doc.
         * @param inputParameter
         * @param secondInputParameter
         * @return <p>The string.
         */
        @NonNull
        String apply(@NonNull final String inputParameter, @NonNull final String secondInputParameter);
    }
    @FunctionalInterface
    public interface NoCommentsNoNamedParams {
        @NonNull
        String apply(@NonNull final String p0, @NonNull final String p1);
    }
    @FunctionalInterface
    public interface NoCommentsWithNamedParams {
        @NonNull
        String apply(@NonNull final String first, @NonNull final String second);
    }
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected LambdaComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}