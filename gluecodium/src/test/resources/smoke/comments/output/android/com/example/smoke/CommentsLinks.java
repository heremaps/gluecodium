/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
/**
 * <p>The nested types like {@link com.example.smoke.CommentsLinks#randomMethod(String, boolean)} don't need full name prefix, but it's
 * possible to references other interfaces like {@link com.example.smoke.CommentsInterface} or other members
 * {@link com.example.smoke.Comments#someMethodWithAllComments}.</p>
 * <p>Weblinks are not modified like this <a href="http://example.com/1">example1</a>, <a href="http://www.example.com/2">example2</a> or <a href="https://www.example.com/3">https://www.example.com/3</a>.</p>
 */
public final class CommentsLinks extends NativeBase {
    /**
     * <p>Links also work in:</p>
     */
    public static final class RandomStruct {
        /**
         * <p>Some random field {@link com.example.smoke.Comments.SomeStruct}</p>
         */
        @NonNull
        public Comments.SomeStruct randomField;
        /**
         * <p>constructor comments {@link com.example.smoke.Comments.SomeStruct}</p>
         * @param randomField <p>Some random field {@link com.example.smoke.Comments.SomeStruct}</p>
         */
        public RandomStruct(@NonNull final Comments.SomeStruct randomField) {
            this.randomField = randomField;
        }
    }
    /**
     * For internal use only.
     * @exclude
     */
    protected CommentsLinks(final long nativeHandle, final Object dummy) {
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
     * <li>property: {@link com.example.smoke.Comments#isSomeProperty}</li>
     * <li>property setter: {@link com.example.smoke.Comments#setSomeProperty}</li>
     * <li>property getter: {@link com.example.smoke.Comments#isSomeProperty}</li>
     * <li>method: {@link com.example.smoke.Comments#someMethodWithAllComments}</li>
     * <li>method with signature: {@link com.example.smoke.Comments#oneParameterCommentOnly}</li>
     * <li>method with signature with no spaces: {@link com.example.smoke.Comments#oneParameterCommentOnly}</li>
     * <li>parameter: {@link com.example.smoke.CommentsLinks#randomMethod#inputParameter}</li>
     * <li>top level constant: {@link com.example.smoke.CommentsTypeCollection#TYPE_COLLECTION_CONSTANT}</li>
     * <li>top level struct: {@link com.example.smoke.TypeCollectionStruct}</li>
     * <li>top level struct field: {@link com.example.smoke.TypeCollectionStruct#field}</li>
     * <li>top level enum: {@link com.example.smoke.TypeCollectionEnum}</li>
     * <li>top level enum item: {@link com.example.smoke.TypeCollectionEnum#ITEM}</li>
     * <li>error: {@link com.example.smoke.Comments.SomethingWrongException}</li>
     * <li>lambda: {@link com.example.smoke.SomeLambda}</li>
     * <li>type from aux sources, same package: {@link com.example.smoke.AuxClass}</li>
     * <li>type from aux sources, different package: {@link com.example.fire.AuxStruct}
     * <ul>
     * <li>we can also have</li>
     * <li>nested lists</li>
     * </ul>
     * </li>
     * </ul>
     * <p>Not working for Java:</p>
     * <ul>
     * <li>typedef: [comments.Usefulness]</li>
     * <li>top level typedef: [CommentsTypeCollection.TypeCollectionTypedef]</li>
     * </ul>
     * <p>Not working for Swift:</p>
     * <ul>
     * <li>named comment: {@link com.example.smoke.Comments#VERY_USEFUL}</li>
     * </ul>
     * @param inputParameter <p>Sometimes takes {@link com.example.smoke.Comments.SomeEnum#USEFUL}</p>
     * @return <p>Sometimes returns {@link com.example.smoke.Comments.SomeEnum#USEFUL}</p>
     * @throws Comments.SomethingWrongException <p>May or may not throw {@link com.example.smoke.Comments.SomethingWrongException}</p>
     */
    @NonNull
    public native Comments.SomeEnum randomMethod(@NonNull final Comments.SomeEnum inputParameter) throws Comments.SomethingWrongException;
    /**
     * <p>Links to method overloads:</p>
     * <ul>
     * <li>other one: {@link com.example.smoke.CommentsLinks#randomMethod(Comments.SomeEnum)}</li>
     * <li>this one: {@link com.example.smoke.CommentsLinks#randomMethod(String, boolean)}</li>
     * <li>ambiguous one: {@link com.example.smoke.CommentsLinks#randomMethod(String, boolean)}</li>
     * </ul>
     * @param text
     * @param flag
     */
    public native void randomMethod(@NonNull final String text, final boolean flag);
}
