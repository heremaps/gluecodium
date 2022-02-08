/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.Date;
public final class DateDefaults {
    @NonNull
    public Date dateTime;
    @NonNull
    public Date dateTimeUtc;
    @NonNull
    public Date beforeEpoch;
    @NonNull
    public Date exactlyEpoch;
    public DateDefaults() {
        this.dateTime = new Date(1643966117000L);
        this.dateTimeUtc = new Date(1643966117000L);
        this.beforeEpoch = new Date(-1511793883000L);
        this.exactlyEpoch = new Date(0L);
    }
    public DateDefaults(@NonNull final Date dateTime, @NonNull final Date dateTimeUtc, @NonNull final Date beforeEpoch, @NonNull final Date exactlyEpoch) {
        this.dateTime = dateTime;
        this.dateTimeUtc = dateTimeUtc;
        this.beforeEpoch = beforeEpoch;
        this.exactlyEpoch = exactlyEpoch;
    }
}
