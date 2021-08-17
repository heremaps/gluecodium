/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment</p>
 */
public final class JavaDeprecatedPosDefaults {
    /**
     * <p>first init!</p>
     */
    public int firstInitField;
    /**
     * <p>first free!</p>
     */
    @NonNull
    public String firstFreeField;
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     */
    public JavaDeprecatedPosDefaults(@NonNull final String firstFreeField) {
        this.firstInitField = 42;
        this.firstFreeField = firstFreeField;
    }
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param firstInitField <p>first init!</p>
     * @deprecated Sorry, this is deprecated.
     */
    @Deprecated("Sorry, this is deprecated.")
    public JavaDeprecatedPosDefaults(@NonNull final String firstFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.firstInitField = firstInitField;
    }
}
