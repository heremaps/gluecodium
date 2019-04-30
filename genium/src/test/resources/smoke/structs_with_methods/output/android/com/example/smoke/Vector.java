/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public class Vector {
    public double x;
    public double y;
    public Vector() {
        this(0, 0);
    }
    public Vector(double x, double y) {
        this.x = x;
        this.y = y;
    }
    public native double distanceTo(@NonNull final Vector other);
    @NonNull
    public native Vector add(@NonNull final Vector other);
}
