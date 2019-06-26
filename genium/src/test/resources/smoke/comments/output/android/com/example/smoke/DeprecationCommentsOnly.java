/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
/**
 * @deprecated <p>Unfortunately, this interface is deprecated.</p>
 */
@Deprecated
public interface DeprecationCommentsOnly {
    /**
     * @deprecated <p>Unfortunately, this constant is deprecated.</p>
     */
    @Deprecated
    public static final boolean VERY_USEFUL = true;
    /**
     * @deprecated <p>Unfortunately, this enum is deprecated.</p>
     */
    @Deprecated
    public enum SomeEnum {
        /**
         * @deprecated <p>Unfortunately, this item is deprecated.</p>
         */
        @Deprecated
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * @deprecated <p>Unfortunately, this struct is deprecated.</p>
     */
    @Deprecated
    public static class SomeStruct {
        /**
         * @deprecated <p>Unfortunately, this field is deprecated.</p>
         */
        @Deprecated
        public boolean someField;
        public SomeStruct(boolean someField) {
            this.someField = someField;
        }
    }
    /**
     *
     * @deprecated <p>Unfortunately, this method is deprecated.</p>
     * @param input Very useful input parameter
     * @return Usefulness of the input
     */
    @Deprecated
    boolean someMethodWithAllComments(final String input);
    /**
     *
     * @deprecated <p>Unfortunately, this attribute is deprecated.</p>
     */
    @Deprecated
    boolean isSomeAttribute();
    /**
     *
     * @deprecated Unfortunately, this attribute is deprecated.
     */
    @Deprecated
    void setSomeAttribute(final boolean value);
}
