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
     * @deprecated <p>Unfortunately, this exception is deprecated, please use {@link com.example.smoke.Comments.SomeEnumException} instead.</p>
     */
    public final static class SomeEnumException extends Exception {
        public SomeEnumException(final DeprecationComments.SomeEnum error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final DeprecationComments.SomeEnum error;
    }
    /**
     * <p>This is some very useful struct.</p>
     * @deprecated <p>Unfortunately, this struct is deprecated. Use {@link com.example.smoke.Comments.SomeStruct} instead.</p>
     */
    @Deprecated
    public final static class SomeStruct {
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
     * @param input <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     */
    @Deprecated
    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     * <p>Gets some very useful property.</p>
     * @deprecated <p>Unfortunately, this property's getter is deprecated.
     * Use {@link com.example.smoke.Comments#isSomeProperty} instead.</p>
     */
    @Deprecated
    boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.</p>
     * @deprecated <p>Unfortunately, this property's setter is deprecated.
     * Use {@link com.example.smoke.Comments#setSomeProperty} instead.</p>
     * @param value Some very useful property.
     */
    @Deprecated
    void setSomeProperty(final boolean value);
}
