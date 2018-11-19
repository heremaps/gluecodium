/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
/**
 * This is some very useful interface.
 */
public interface CommentsInterface {
    /**
     * This is some very useful constant.
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * This is some very useful enum.
     */
    public enum SomeEnum {
        /**
         * Not quite useful
         */
        USELESS(0),
        /**
         * Somewhat useful
         */
        USEFUL(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * This is some very useful struct.
     */
    public static class SomeStruct {
        /**
         * How useful this struct is
         */
        public boolean someField;
        public SomeStruct() {
            this(false);
        }
        public SomeStruct(boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    boolean someMethodWithAllComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @param input Very useful input parameter
     */
    boolean someMethodWithInputComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of its input.
     * @return Usefulness of the input
     */
    boolean someMethodWithOutputComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of its input.
     */
    boolean someMethodWithNoComments(final String input);
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     * @param input Very useful input parameter
     */
    void someMethodWithoutReturnTypeWithAllComments(final String input);
    /**
     * This is some very useful method that does not measure the usefulness of its input.
     */
    void someMethodWithoutReturnTypeWithNoComments(final String input);
    /**
     * This is some very useful method that measures the usefulness of something.
     * @return Usefulness of the input
     */
    boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * This is some very useful method that measures the usefulness of something.
     */
    boolean someMethodWithoutInputParametersWithNoComments();
    void someMethodWithNothing();
    /**
     * This is some very useful method that does nothing.
     */
    void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * This is some very useful attribute.
     */
    boolean isSomeAttribute();
    /**
     * This is some very useful attribute.
     */
    void setSomeAttribute(final boolean value);
}
