/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment
 */
public final class JavaDeprecatedPosDefaultsCustom {
    /**
     * <p>first init!
     */
    public int firstInitField;
    /**
     * <p>first free!
     */
    @NonNull
    public String firstFreeField;
    public JavaDeprecatedPosDefaultsCustom() {
        JavaDeprecatedPosDefaultsCustom _other = custom();
        this.firstInitField = _other.firstInitField;
        this.firstFreeField = _other.firstFreeField;
    }
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param firstInitField <p>first init!
     * @deprecated Sorry, this is deprecated.
     */
    @Deprecated("Sorry, this is deprecated.")
    public JavaDeprecatedPosDefaultsCustom(@NonNull final String firstFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.firstInitField = firstInitField;
    }
    private static native JavaDeprecatedPosDefaultsCustom custom();
}
