/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment</p>
 */
public final class StructWithJavaPositionalDefaults {
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
     * <p>second init yeah!</p>
     */
    public float secondInitField;
    /**
     * <p>second free here!</p>
     */
    public boolean secondFreeField;
    /**
     * <p>third should be last!</p>
     */
    @NonNull
    public String thirdInitField;
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param secondFreeField <p>second free here!</p>
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField) {
        this.firstInitField = 42;
        this.firstFreeField = firstFreeField;
        this.secondInitField = 7.2f;
        this.secondFreeField = secondFreeField;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param secondFreeField <p>second free here!</p>
     * @param firstInitField <p>first init!</p>
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = 7.2f;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param secondFreeField <p>second free here!</p>
     * @param firstInitField <p>first init!</p>
     * @param secondInitField <p>second init yeah!</p>
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField, final float secondInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = secondInitField;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz</p>
     * @param firstFreeField <p>first free!</p>
     * @param secondFreeField <p>second free here!</p>
     * @param firstInitField <p>first init!</p>
     * @param secondInitField <p>second init yeah!</p>
     * @param thirdInitField <p>third should be last!</p>
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField, final float secondInitField, @NonNull final String thirdInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = secondInitField;
        this.thirdInitField = thirdInitField;
    }
}
