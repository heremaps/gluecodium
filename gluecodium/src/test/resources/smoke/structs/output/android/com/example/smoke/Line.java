/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class Line {
    @NonNull
    public com.example.smoke.Point a;
    @NonNull
    public com.example.smoke.Point b;
    public Line(@NonNull final com.example.smoke.Point a, @NonNull final com.example.smoke.Point b) {
        this.a = a;
        this.b = b;
    }
}
