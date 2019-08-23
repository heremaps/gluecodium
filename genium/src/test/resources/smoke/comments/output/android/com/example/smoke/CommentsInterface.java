/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>This is some very useful interface.</p>
 */
public interface CommentsInterface {
    /**
     * <p>This is some very useful constant.</p>
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.</p>
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful</p>
         */
        USELESS(0),
        /**
         * <p>Somewhat useful</p>
         */
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful struct.</p>
     */
    public final static class SomeStruct {
        /**
         * <p>How useful this struct is</p>
         */
        public boolean someField;
        public SomeStruct(final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     */
    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input <p>Very useful input parameter</p>
     * @return
     */
    boolean someMethodWithInputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input
     * @return <p>Usefulness of the input</p>
     */
    boolean someMethodWithOutputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input
     * @return
     */
    boolean someMethodWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.</p>
     * @param input <p>Very useful input parameter</p>
     */
    void someMethodWithoutReturnTypeWithAllComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.</p>
     * @param input
     */
    void someMethodWithoutReturnTypeWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of something.</p>
     * @return <p>Usefulness of the input</p>
     */
    boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * <p>This is some very useful method that measures the usefulness of something.</p>
     * @return
     */
    boolean someMethodWithoutInputParametersWithNoComments();
    void someMethodWithNothing();
    /**
     * <p>This is some very useful method that does nothing.</p>
     */
    void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * <p>Gets some very useful property.</p>
     */
    boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.</p>
     * @param value Some very useful property.
     */
    void setSomeProperty(final boolean value);
}
