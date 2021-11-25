/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
/**
 * <p>Foo Bar this is a comment
 */
public final class StructWithJavaPositionalDefaults {
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
     * <p>second init yeah!
     */
    public float secondInitField;
    /**
     * <p>second free here!
     */
    public boolean secondFreeField;
    /**
     * <p>third should be last!
     */
    @NonNull
    public String thirdInitField;
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param secondFreeField <p>second free here!
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField) {
        this.firstInitField = 42;
        this.firstFreeField = firstFreeField;
        this.secondInitField = 7.2f;
        this.secondFreeField = secondFreeField;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param secondFreeField <p>second free here!
     * @param firstInitField <p>first init!
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = 7.2f;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param secondFreeField <p>second free here!
     * @param firstInitField <p>first init!
     * @param secondInitField <p>second init yeah!
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField, final float secondInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = secondInitField;
        this.thirdInitField = "\\Jonny \"Magic\" Smith\n";
    }
    /**
     * <p>buzz fizz
     * @param firstFreeField <p>first free!
     * @param secondFreeField <p>second free here!
     * @param firstInitField <p>first init!
     * @param secondInitField <p>second init yeah!
     * @param thirdInitField <p>third should be last!
     */
    public StructWithJavaPositionalDefaults(@NonNull final String firstFreeField, final boolean secondFreeField, final int firstInitField, final float secondInitField, @NonNull final String thirdInitField) {
        this.firstFreeField = firstFreeField;
        this.secondFreeField = secondFreeField;
        this.firstInitField = firstInitField;
        this.secondInitField = secondInitField;
        this.thirdInitField = thirdInitField;
    }
}
