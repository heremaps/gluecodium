/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class ImmutableStructWithClash {
    @NonNull
    public final String stringField;
    public final int intField;
    public final boolean boolField;
    public ImmutableStructWithClash() {
        this.stringField = "nonsense";
        this.intField = 42;
        this.boolField = true;
    }
    public ImmutableStructWithClash(final boolean boolField, final int intField, @NonNull final String stringField) {
        this.boolField = boolField;
        this.intField = intField;
        this.stringField = stringField;
    }
}
