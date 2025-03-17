/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.AbstractNativeList;
import java.util.List;

public final class UseOptimizedListStruct {
    @NonNull
    public final List<VeryBigStruct> structs;
    @NonNull
    public final List<UnreasonablyLazyClass> classes;

    public UseOptimizedListStruct(@NonNull final List<VeryBigStruct> structs, @NonNull final List<UnreasonablyLazyClass> classes) {
        this.structs = structs;
        this.classes = classes;
    }


    /**
     * @hidden
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
        protected native int obtainSize();

        @Override
        public native VeryBigStruct get(int index);
    }

    /**
     * @hidden
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
        protected native int obtainSize();

        @Override
        public native UnreasonablyLazyClass get(int index);
    }

}

