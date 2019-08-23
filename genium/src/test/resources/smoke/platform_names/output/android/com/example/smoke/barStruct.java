/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class barStruct {
    @NonNull
    public String BAR_FIELD;
    public barStruct(@NonNull final String BarParameter) {
        barStruct _other = BarCreate(BarParameter);
        this.BAR_FIELD = _other.BAR_FIELD;
    }
    private static native barStruct BarCreate(@NonNull final String BarParameter);
}