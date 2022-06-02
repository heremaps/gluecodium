/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructWithPosEnums {
    public static final SomethingEnum FIRST_CONSTANT = SomethingEnum.REALLY_FIRST;
    @NonNull
    public SomethingEnum firstField;
    @NonNull
    public SomethingEnum explicitField;
    @NonNull
    public SomethingEnum lastField;
    public StructWithPosEnums() {
        this.firstField = SomethingEnum.REALLY_FIRST;
        this.explicitField = SomethingEnum.EXPLICIT;
        this.lastField = SomethingEnum.LAST;
    }
}
