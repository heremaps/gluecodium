/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class FreePoint {
    public static final FreeEnum A_BAR = FreeEnum.BAR;
    public double x;
    public double y;
    public FreePoint(final double x, final double y) {
        this.x = x;
        this.y = y;
    }
    @NonNull
    public native FreePoint flip();
}
