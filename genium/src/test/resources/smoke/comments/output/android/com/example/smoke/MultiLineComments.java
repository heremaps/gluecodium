/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
/**
 * <p>This is some very useful interface.
 * There is a lot to say about this interface.
 * at least it has multiline comments.</p>
 * <h2>I am a heading</h2>
 * <p>And now comes a list:</p>
 * <ul>
 * <li>asterisk</li>
 * <li>needs</li>
 * <li>escaping</li>
 * </ul>
 * <p><code>Some example code;</code></p>
 */
public class MultiLineComments extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected MultiLineComments(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>This is very important method.
     * It has very important parameters.
     * It has side effects.</p>
     * @param input Very useful input parameter.
     *     You must not confuse it with the second parameter.
     *     But they are similar.
     * @param ratio Not as useful as the first parameter.
     *     But still useful.
     *     use a positive value for more happiness.
     * @return If you provide a useful input,
     *     and a useful ratio you can expect a useful output.
     *     Just kidding do not expect anything from a method until
     *     you see its body.
     */
    public native float someMethodWithLongComment(final String input, final double ratio);
}