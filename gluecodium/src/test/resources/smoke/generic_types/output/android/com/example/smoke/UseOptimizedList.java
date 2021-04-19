/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.AbstractNativeList;
import com.example.NativeBase;
import java.util.List;
public final class UseOptimizedList extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected UseOptimizedList(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native List<VeryBigStruct> fetchTheBigOnes();
    @NonNull
    public static native List<UnreasonablyLazyClass> getLazyOnes();
    /**
     * @exclude
     */
    private final static class UnreasonablyLazyClassLazyNativeList extends AbstractNativeList<UnreasonablyLazyClass> {
        private UnreasonablyLazyClassLazyNativeList(final long nativeHandle, Object dummy) {
          super(nativeHandle, new Disposer() {
              @Override
              public void disposeNative(long handle) {
                  disposeNativeHandle(handle);
              }
          });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @Override
        protected native int getSize();
        @Override
        public native UnreasonablyLazyClass get(int index);
    }
    /**
     * @exclude
     */
    private final static class VeryBigStructLazyNativeList extends AbstractNativeList<VeryBigStruct> {
        private VeryBigStructLazyNativeList(final long nativeHandle, Object dummy) {
          super(nativeHandle, new Disposer() {
              @Override
              public void disposeNative(long handle) {
                  disposeNativeHandle(handle);
              }
          });
        }
        private static native void disposeNativeHandle(long nativeHandle);
        @Override
        protected native int getSize();
        @Override
        public native VeryBigStruct get(int index);
    }
}
