/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>This is some very useful interface. There is a lot to say about this interface. at least it has a long comment.</p>
 */
public final class LongComments extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected LongComments(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>This is very important method. It has very important parameters. It has side effects.</p>
     * @param input <p>Very useful input parameter. You must not confuse it with the second parameter. But they are similar.</p>
     * @param ratio <p>Not as useful as the first parameter. But still useful. use a positive value for more happiness.</p>
     * @return <p>If you provide a useful input and a useful ratio you can expect a useful output. Just kidding do not expect anything from a method until you see its body.</p>
     */
    public native float someMethodWithLongComment(@NonNull final String input, final double ratio);
}
