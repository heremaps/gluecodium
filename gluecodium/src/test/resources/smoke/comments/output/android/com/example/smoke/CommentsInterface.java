/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>This is some very useful interface.
 */
public interface CommentsInterface {
    /**
     * <p>This is some very useful constant.
     */
    public static final boolean VERY_USEFUL = true;
    /**
     * <p>This is some very useful enum.
     */
    public enum SomeEnum {
        /**
         * <p>Not quite useful
         */
        USELESS(0),
        /**
         * <p>Somewhat useful
         */
        USEFUL(1);
        /**
         * @hidden
         */
        public final int value;

        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This is some very useful struct.
     */
    public static final class SomeStruct {
        /**
         * <p>How useful this struct is
         */
        public boolean someField;

        public SomeStruct(final boolean someField) {
            this.someField = someField;
        }


    }

    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input <p>Very useful input parameter
     * @return <p>Usefulness of the input
     */



    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input <p>Very useful input parameter
     * @return
     */



    boolean someMethodWithInputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return <p>Usefulness of the input
     */



    boolean someMethodWithOutputComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of its input.
     * @param input
     * @return
     */



    boolean someMethodWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.
     * @param input <p>Very useful input parameter
     */



    void someMethodWithoutReturnTypeWithAllComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that does not measure the usefulness of its input.
     * @param input
     */



    void someMethodWithoutReturnTypeWithNoComments(@NonNull final String input);
    /**
     * <p>This is some very useful method that measures the usefulness of something.
     * @return <p>Usefulness of the input
     */



    boolean someMethodWithoutInputParametersWithAllComments();
    /**
     * <p>This is some very useful method that measures the usefulness of something.
     * @return
     */



    boolean someMethodWithoutInputParametersWithNoComments();


    void someMethodWithNothing();
    /**
     * <p>This is some very useful method that does nothing.
     */



    void someMethodWithoutReturnTypeOrInputParameters();
    /**
     * <p>Gets some very useful property.
     * @return <p>Some very useful property.
     */



    boolean isSomeProperty();
    /**
     * <p>Sets some very useful property.
     * @param value <p>Some very useful property.
     */



    void setSomeProperty(final boolean value);
}

