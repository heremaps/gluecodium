/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FieldCustomConstructorsMix {
    @NonNull
    public String stringField;
    public int intField;
    public boolean boolField;
    public FieldCustomConstructorsMix(final int intValue, final double dummy) {
        FieldCustomConstructorsMix _other = createMe(intValue, dummy);
        this.stringField = _other.stringField;
        this.intField = _other.intField;
        this.boolField = _other.boolField;
    }
    public FieldCustomConstructorsMix(final int intField) {
        this.intField = intField;
        this.stringField = "nonsense";
        this.boolField = true;
    }
    private static native FieldCustomConstructorsMix createMe(final int intValue, final double dummy);
}
