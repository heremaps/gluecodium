/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class ImmutableStructNoClash {
    @NonNull
    public final String stringField;
    public final int intField;
    public final boolean boolField;
    public ImmutableStructNoClash(@NonNull final String stringField, final int intField, final boolean boolField) {
        this.stringField = stringField;
        this.intField = intField;
        this.boolField = boolField;
    }
    public ImmutableStructNoClash() {
        this.stringField = "nonsense";
        this.intField = 42;
        this.boolField = true;
    }
}
