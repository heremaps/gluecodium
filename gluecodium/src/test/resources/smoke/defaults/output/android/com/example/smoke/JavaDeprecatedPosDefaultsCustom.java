/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment</p>
 */
public final class JavaDeprecatedPosDefaultsCustom {
    /**
     * <p>first init!</p>
     */
    public int firstInitField;
    /**
     * <p>first free!</p>
     */
    @NonNull
    public String firstFreeField;
    public JavaDeprecatedPosDefaultsCustom() {
        JavaDeprecatedPosDefaultsCustom _other = custom();
        this.firstInitField = _other.firstInitField;
        this.firstFreeField = _other.firstFreeField;
    }
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param firstInitField <p>first init!</p>
     * @deprecated Sorry, this is deprecated.
     */
    @Deprecated("Sorry, this is deprecated.")
    public JavaDeprecatedPosDefaultsCustom(@NonNull final String firstFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.firstInitField = firstInitField;
    }
    private static native JavaDeprecatedPosDefaultsCustom custom();
}
