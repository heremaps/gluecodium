/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>This is some very useful interface.
 * @deprecated <p>Unfortunately, this interface is deprecated. Use {@link com.example.smoke.Comments} instead.
 */
@Deprecated
public interface DeprecationComments {
    /**
     * <p>This is some very useful constant.
     * @deprecated <p>Unfortunately, this constant is deprecated. Use {@link com.example.smoke.Comments#VERY_USEFUL} instead.
     */
    @Deprecated
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.
     * @deprecated <p>Unfortunately, this enum is deprecated. Use {@link com.example.smoke.Comments.SomeEnum} instead.
     */
    @Deprecated
    public enum SomeEnum {
        /**
         * <p>Not quite useful
         * @deprecated <p>Unfortunately, this item is deprecated.
         * Use {@link com.example.smoke.Comments.SomeEnum#USELESS} instead.
         */
        @Deprecated
        USELESS(0);
        /**
         * @hidden
         */
        public final int value;

        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**

     * @deprecated <p>Unfortunately, this exception is deprecated, please use {@link com.example.smoke.Comments.SomethingWrongException} instead.
     */
    @Deprecated
    public static final class SomethingWrongException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public SomethingWrongException(final DeprecationComments.SomeEnum error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final DeprecationComments.SomeEnum error;
    }
    /**
     * <p>This is some very useful struct.
     * @deprecated <p>Unfortunately, this struct is deprecated. Use {@link com.example.smoke.Comments.SomeStruct} instead.
     */
    @Deprecated
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is.
         * @deprecated <p>Unfortunately, this field is deprecated.
         * Use {@link com.example.smoke.Comments.SomeStruct#someField} instead.
         */
        @Deprecated
        public boolean someField;

        public SomeStruct() {
            this.someField = false;
        }


    }

    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @deprecated <p>Unfortunately, this method is deprecated.
     * Use {@link com.example.smoke.Comments#someMethodWithAllComments} instead.
     * @param input <p>Very useful input parameter
     * @return <p>Usefulness of the input
     */
    @Deprecated


    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     * <p>Gets some very useful property.
     * @deprecated <p>Unfortunately, this property's getter is deprecated.
     * Use {@link com.example.smoke.Comments#isSomeProperty} instead.
     * @return <p>Some very useful property.
     */
    @Deprecated


    boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.
     * @deprecated <p>Unfortunately, this property's setter is deprecated.
     * Use {@link com.example.smoke.Comments#setSomeProperty} instead.
     * @param value <p>Some very useful property.
     */
    @Deprecated


    void setSomeProperty(final boolean value);
    /**
     * <p>Gets the property but not accessors.
     * @deprecated <p>Will be removed in v3.2.1.
     * @return <p>Describes the property but not accessors.
     */
    @Deprecated


    @NonNull
    String getPropertyButNotAccessors();
    /**
     *
     * @deprecated <p>Will be removed in v3.2.1.
     * @param value <p>Describes the property but not accessors.
     */
    @Deprecated


    void setPropertyButNotAccessors(@NonNull final String value);
}

