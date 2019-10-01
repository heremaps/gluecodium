/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
    public final static class SomeStruct {
        /**
         * @deprecated <p>Unfortunately, this field is deprecated.</p>
         */
        @Deprecated
        public boolean someField;
        public SomeStruct(@Deprecated final boolean someField) {
            this.someField = someField;
        }
    }
    /**
     *
     * @deprecated <p>Unfortunately, this method is deprecated.</p>
     * @param input <p>Very useful input parameter</p>
     * @return <p>Usefulness of the input</p>
     */
    @Deprecated
    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     *
     * @deprecated <p>Unfortunately, this property's getter is deprecated.</p>
     */
    @Deprecated
    boolean isSomeProperty();
    /**
     *
     * @deprecated <p>Unfortunately, this property's setter is deprecated.</p>
     * @param value
     */
    @Deprecated
    void setSomeProperty(final boolean value);
}
