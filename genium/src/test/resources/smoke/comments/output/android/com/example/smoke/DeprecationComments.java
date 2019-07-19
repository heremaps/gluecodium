/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>This is some very useful interface.</p>
 * @deprecated <p>Unfortunately, this interface is deprecated. Use {@link com.example.smoke.Comments} instead.</p>
 */
@Deprecated
public interface DeprecationComments {
    /**
     * <p>This is some very useful constant.</p>
     * @deprecated <p>Unfortunately, this constant is deprecated. Use {@link com.example.smoke.Comments#VERY_USEFUL} instead.</p>
     */
    @Deprecated
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     * @deprecated <p>Unfortunately, this enum is deprecated. Use {@link com.example.smoke.Comments.SomeEnum} instead.</p>
     */
    @Deprecated
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         * @deprecated <p>Unfortunately, this item is deprecated.
         * Use {@link com.example.smoke.Comments.SomeEnum#USELESS} instead.</p>
         */
        @Deprecated
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful struct.</p>
     * @deprecated <p>Unfortunately, this struct is deprecated. Use {@link com.example.smoke.Comments.SomeStruct} instead.</p>
     */
    @Deprecated
    public static class SomeStruct {
        /**
         * <p>How useful this struct is.</p>
         * @deprecated <p>Unfortunately, this field is deprecated.
         * Use {@link com.example.smoke.Comments.SomeStruct#someField} instead.</p>
         */
        @Deprecated
        public boolean someField;
        public SomeStruct(@Deprecated final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @deprecated <p>Unfortunately, this method is deprecated.
     * Use {@link com.example.smoke.Comments#someMethodWithAllComments} instead.</p>
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated
    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     * <p>Gets some very useful attribute.</p>
     * @deprecated <p>Unfortunately, this attribute is deprecated.
     * Use {@link com.example.smoke.Comments#isSomeAttribute} instead.</p>
     */
    @Deprecated
    boolean isSomeAttribute();
    /**
     * <p>Sets some very useful attribute.</p>
     * @deprecated <p>Unfortunately, this attribute is deprecated.
     * Use {@link com.example.smoke.Comments#isSomeAttribute} instead.</p>
     * @param value
     */
    @Deprecated
    void setSomeAttribute(final boolean value);
}