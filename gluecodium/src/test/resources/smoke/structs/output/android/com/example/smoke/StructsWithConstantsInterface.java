/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class StructsWithConstantsInterface extends NativeBase {
    public static final class MultiRoute {
        public static final String DEFAULT_DESCRIPTION = "Foo";
        public static final RouteUtils.RouteType DEFAULT_TYPE = RouteUtils.RouteType.NONE;
        @NonNull
        public List<String> descriptions;
        @NonNull
        public RouteUtils.RouteType type;
        public MultiRoute(@NonNull final List<String> descriptions, @NonNull final RouteUtils.RouteType type) {
            this.descriptions = descriptions;
            this.type = type;
        }
    }
    public static final class StructWithConstantsOnly {
        public static final String DEFAULT_DESCRIPTION = "Foo";
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected StructsWithConstantsInterface(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
