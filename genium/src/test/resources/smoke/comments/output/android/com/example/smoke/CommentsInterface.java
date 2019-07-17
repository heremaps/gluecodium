/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
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
    public static class SomeStruct {
        /**
         * <p>How useful this struct is</p>
         */
        public boolean someField;
        public SomeStruct(boolean someField) {
            this.someField = someField;
        }
    }
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    boolean someMethodWithAllComments(final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @param input Very useful input parameter
     */
    boolean someMethodWithInputComments(final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     * @return Usefulness of the input
     */
    boolean someMethodWithOutputComments(final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.</p>
     */
    boolean someMethodWithNoComments(final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.</p>
     * @param input Very useful input parameter
     */
    void someMethodWithoutReturnTypeWithAllComments(final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.</p>
     */
    void someMethodWithoutReturnTypeWithNoComments(final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of something.</p>
     * @return Usefulness of the input
     */
    boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * <p>This is some very useful method that measures the usefulness of something.</p>
     */
    boolean someMethodWithoutInputParametersWithNoComments();
    void someMethodWithNothing();
    /**
     * <p>This is some very useful method that does nothing.</p>
     */
    void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * <p>Gets some very useful attribute.</p>
     */
    boolean isSomeAttribute();
    /**
     * <p>Sets some very useful attribute.</p>
     */
    void setSomeAttribute(final boolean value);
}