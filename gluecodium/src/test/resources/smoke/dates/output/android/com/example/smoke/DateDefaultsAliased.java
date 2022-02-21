/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.Date;
public final class DateDefaultsAliased {
    @NonNull
    public Date dateTime;
    @NonNull
    public Date dateTimeUtc;
    @NonNull
    public Date beforeEpoch;
    @NonNull
    public Date exactlyEpoch;
    public DateDefaultsAliased() {
        this.dateTime = new Date(1643966117000L);
        this.dateTimeUtc = new Date(1643966117000L);
        this.beforeEpoch = new Date(-1511793883000L);
        this.exactlyEpoch = new Date(0L);
    }
}
