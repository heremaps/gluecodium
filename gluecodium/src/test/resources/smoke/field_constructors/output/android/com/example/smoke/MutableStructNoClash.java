/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class MutableStructNoClash {
    @NonNull
    public String stringField;
    public int intField;
    public boolean boolField;
    public MutableStructNoClash() {
        this.stringField = "nonsense";
        this.intField = 42;
        this.boolField = true;
    }
}
