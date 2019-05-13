/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.ArrayList;
import java.util.List;
public class StructsWithConstantsInterface extends NativeBase {
    public static class MultiRoute {
        public static final String DEFAULT_DESCRIPTION = "Foo";
        public static final RouteType DEFAULT_TYPE = RouteType.NONE;
        @NonNull
        public List<String> descriptions;
        @NonNull
        public RouteType type;
        public MultiRoute() {
            this(new ArrayList<>(), RouteType.values()[0]);
        }
        public MultiRoute(List<String> descriptions, RouteType type) {
            this.descriptions = descriptions;
            this.type = type;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected StructsWithConstantsInterface(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
