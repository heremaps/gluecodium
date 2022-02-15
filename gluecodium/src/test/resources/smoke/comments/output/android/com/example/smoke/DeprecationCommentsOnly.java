/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * @deprecated <p>Unfortunately, this interface is deprecated.
 */
@Deprecated
public interface DeprecationCommentsOnly {
    /**
     * @deprecated <p>Unfortunately, this constant is deprecated.
     */
    @Deprecated
    public static final boolean VERY_USEFUL = true;
    /**
     * @deprecated <p>Unfortunately, this enum is deprecated.
     */
    @Deprecated
    public enum SomeEnum {
        /**
         * @deprecated <p>Unfortunately, this item is deprecated.
         */
        @Deprecated
        USELESS(0);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    /**
     * @deprecated <p>Unfortunately, this struct is deprecated.
     */
    @Deprecated
    public static final class SomeStruct {
        /**
         * @deprecated <p>Unfortunately, this field is deprecated.
         */
        @Deprecated
        public boolean someField;
        public SomeStruct() {
            this.someField = false;
        }
    }
    /**
     *
     * @deprecated <p>Unfortunately, this method is deprecated.
     * @param input <p>Very useful input parameter
     * @return <p>Usefulness of the input
     */
    @Deprecated
    boolean someMethodWithAllComments(@NonNull final String input);
    /**
     *
     * @deprecated <p>Unfortunately, this property's getter is deprecated.
     */
    @Deprecated
    boolean isSomeProperty();
    /**
     *
     * @deprecated <p>Unfortunately, this property's setter is deprecated.
     * @param value
     */
    @Deprecated
    void setSomeProperty(final boolean value);
}
