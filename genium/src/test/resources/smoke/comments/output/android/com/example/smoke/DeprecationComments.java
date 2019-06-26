/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
/**
 * <p>This is some very useful interface.</p>
 * @deprecated <p>Unfortunately, this interface is deprecated. Use {@link com.example.smoke.Comments} instead.</p>
 */
public interface DeprecationComments {
    /**
     * <p>This is some very useful constant.</p>
     * @deprecated <p>Unfortunately, this constant is deprecated. Use {@link com.example.smoke.Comments#VERY_USEFUL} instead.</p>
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     * @deprecated <p>Unfortunately, this enum is deprecated. Use {@link com.example.smoke.Comments.SomeEnum} instead.</p>
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         * @deprecated <p>Unfortunately, this item is deprecated.
         * Use {@link com.example.smoke.Comments.SomeEnum#USELESS} instead.</p>
         */
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
    public static class SomeStruct {
        /**
         * <p>How useful this struct is.</p>
         * @deprecated <p>Unfortunately, this field is deprecated.
         * Use {@link com.example.smoke.Comments.SomeStruct#someField} instead.</p>
         */
        public boolean someField;
        public SomeStruct(boolean someField) {
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
    boolean someMethodWithAllComments(final String input);
    /**
     * <p>Gets some very useful attribute.</p>
     * @deprecated <p>Unfortunately, this attribute is deprecated.
     * Use {@link com.example.smoke.Comments#isSomeAttribute} instead.</p>
     */
    boolean isSomeAttribute();
    /**
     * Sets some very useful attribute.
     * @deprecated Unfortunately, this attribute is deprecated.
     * Use [comments.SomeAttribute] instead.
     */
    void setSomeAttribute(final boolean value);
}
