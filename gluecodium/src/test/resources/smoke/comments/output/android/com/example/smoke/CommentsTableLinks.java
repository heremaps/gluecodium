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
 * <tr><td>col 1 is</td><td align="center">{@link com.example.smoke.CommentsTable}</td><td align="right">$1600</td></tr>
 * <tr><td>col 2 is</td><td align="center">{@link com.example.smoke.Comments.SomeEnum}</td><td align="right">$12</td></tr>
 * <tr><td>col 3 is</td><td align="center">{@link com.example.smoke.Comments.SomeEnum#USEFUL}</td><td align="right">$1</td></tr>
 * </tbody>
 * </table>
 */
public final class CommentsTableLinks extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected CommentsTableLinks(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
