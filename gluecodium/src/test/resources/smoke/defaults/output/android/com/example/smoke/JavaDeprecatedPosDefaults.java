/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment
 */
public final class JavaDeprecatedPosDefaults {
    /**
     * <p>first init!
     */
    public int firstInitField;
    /**
     * <p>first free!
     */
    @NonNull
    public String firstFreeField;
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     */
    public JavaDeprecatedPosDefaults(@NonNull final String firstFreeField) {
        this.firstInitField = 42;
        this.firstFreeField = firstFreeField;
    }
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param firstInitField <p>first init!
     * @deprecated Sorry, this is deprecated.
     */
    @Deprecated("Sorry, this is deprecated.")
    public JavaDeprecatedPosDefaults(@NonNull final String firstFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.firstInitField = firstInitField;
    }
}
