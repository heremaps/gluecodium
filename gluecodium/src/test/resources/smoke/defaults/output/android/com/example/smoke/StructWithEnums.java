/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithEnums {
    public static final SomethingEnum FIRST_CONSTANT = SomethingEnum.REALLY_FIRST;
    @NonNull
    public SomethingEnum firstField;
    @NonNull
    public SomethingEnum explicitField;
    @NonNull
    public SomethingEnum lastField;
    public StructWithEnums() {
        this.firstField = SomethingEnum.REALLY_FIRST;
        this.explicitField = SomethingEnum.EXPLICIT;
        this.lastField = SomethingEnum.LAST;
    }
    public StructWithEnums(@NonNull final SomethingEnum firstField, @NonNull final SomethingEnum explicitField, @NonNull final SomethingEnum lastField) {
        this.firstField = firstField;
        this.explicitField = explicitField;
        this.lastField = lastField;
    }
}
