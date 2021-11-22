/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
/**
 * <p>First line.
 * Second line.</p>
 * <p>Another paragraph. <strong>bold</strong> and <em>italic</em> and <code>code</code>.</p>
 * <blockquote>
 * <p>blockquote</p>
 * </blockquote>
 * <h1>Heading one</h1>
 * <h2>Heading two</h2>
 * <h3>Heading three</h3>
 * <p>Unordered list:</p>
 * <ul>
 * <li>A</li>
 * <li>B</li>
 * </ul>
 * <p>Ordered list:</p>
 * <ol>
 * <li>foo</li>
 * <li>bar</li>
 * </ol>
 * <hr />
 * <p><a href="https://www.markdownguide.org/cheat-sheet/">title</a></p>
 */
public final class CommentsMarkdown extends NativeBase {
    /**
     * For internal use only.
     * @hidden
     */
    protected CommentsMarkdown(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
