/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class JavaExternalTypesStruct {
    @NonNull
    public java.util.Currency currency;
    @NonNull
    public java.util.SimpleTimeZone timeZone;
    @NonNull
    public java.time.Month month;
    @NonNull
    public java.lang.Integer color;
    @NonNull
    public java.lang.String season;
    public JavaExternalTypesStruct(@NonNull final java.util.Currency currency, @NonNull final java.util.SimpleTimeZone timeZone, @NonNull final java.time.Month month, @NonNull final java.lang.Integer color, @NonNull final java.lang.String season) {
        this.currency = currency;
        this.timeZone = timeZone;
        this.month = month;
        this.color = color;
        this.season = season;
    }
}
