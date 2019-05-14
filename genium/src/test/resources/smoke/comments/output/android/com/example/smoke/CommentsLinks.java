/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>The nested types like {@link com.example.smoke.CommentsLinks#randomMethod} don't need full name prefix, but it's
 * possible to references other interfaces like {@link com.example.smoke.CommentsInterface} or other members
 * {@link com.example.smoke.Comments#someMethodWithAllComments}.</p>
 * <p>Weblinks are not modified like this <a href="http://example.com">example</a> or [www.example.com].</p>
 */
public class CommentsLinks extends NativeBase {
    public enum TooUseful {
        TWICE(0),
        THREE_TIMES(1);
        public final int value;
        TooUseful(final int value) {
            this.value = value;
        }
    }
    public static class TooUsefulException extends Exception {
        public TooUsefulException(final CommentsLinks.TooUseful error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final CommentsLinks.TooUseful error;
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected CommentsLinks(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * <p>Link types:</p>
     * <ul>
     * <li>constant: {@link com.example.smoke.Comments#VERY_USEFUL}</li>
     * <li>struct: {@link com.example.smoke.Comments.SomeStruct}</li>
     * <li>struct field: {@link com.example.smoke.Comments.SomeStruct#someField}</li>
     * <li>enum: {@link com.example.smoke.Comments.SomeEnum}</li>
     * <li>enum item: {@link com.example.smoke.Comments.SomeEnum#USEFUL}</li>
     * <li>attribute: {@link com.example.smoke.Comments#isSomeAttribute}</li>
     * <li>method: {@link com.example.smoke.Comments#instanceMethod}</li>
     * </ul>
     * <p>Not working for Java:</p>
     * <ul>
     * <li>typedef: [comments.Usefulness]</li>
     * <li>array: [comments.SomeArray]</li>
     * <li>map: [comments.SomeMap]</li>
     * </ul>
     * <p>Not working for Swift:</p>
     * <ul>
     * <li>named comment: {@link com.example.smoke.Comments#VERY_USEFUL}</li>
     * </ul>
     * <p>Not working:</p>
     * <ul>
     * <li>error: [TooUsefulException]</li>
     * <li>input parameter: [inputParameter]</li>
     * <li>output parameter: [outputParameter]</li>
     * </ul>
     * @throws CommentsLinks.TooUsefulException
     */
    @NonNull
    public native Comments.SomeEnum randomMethod(@NonNull final Comments.SomeEnum inputParameter) throws CommentsLinks.TooUsefulException;
}