/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
/**
 * <p>Something lorem something ipsum.
 * <table>
 * <thead>
 * <tr><th>Tables</th><th align="center">Are</th><th align="right">Cool</th></tr>
 * </thead>
 * <tbody>
 * <tr><td>col 1 is</td><td align="center">left-aligned</td><td align="right">$1600</td></tr>
 * <tr><td>col 2 is</td><td align="center">centered</td><td align="right">$12</td></tr>
 * <tr><td>col 3 is</td><td align="center">right-aligned</td><td align="right">$1</td></tr>
 * </tbody>
 * </table>
 */
public final class CommentsTable extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected CommentsTable(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
