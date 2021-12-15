/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.time.Duration;
public final class DurationDefaults {
    @NonNull
    public Duration dayz;
    @NonNull
    public Duration hourz;
    @NonNull
    public Duration minutez;
    @NonNull
    public Duration secondz;
    @NonNull
    public Duration milliz;
    @NonNull
    public Duration microz;
    @NonNull
    public Duration nanoz;
    public DurationDefaults() {
        this.dayz = Duration.ofDays(28L);
        this.hourz = Duration.ofHours(22L);
        this.minutez = Duration.ofMinutes(45L);
        this.secondz = Duration.ofSeconds(42L);
        this.milliz = Duration.ofMillis(500L);
        this.microz = Duration.ofNanos(665000L);
        this.nanoz = Duration.ofNanos(314635L);
    }
    public DurationDefaults(@NonNull final Duration dayz, @NonNull final Duration hourz, @NonNull final Duration minutez, @NonNull final Duration secondz, @NonNull final Duration milliz, @NonNull final Duration microz, @NonNull final Duration nanoz) {
        this.dayz = dayz;
        this.hourz = hourz;
        this.minutez = minutez;
        this.secondz = secondz;
        this.milliz = milliz;
        this.microz = microz;
        this.nanoz = nanoz;
    }
}
