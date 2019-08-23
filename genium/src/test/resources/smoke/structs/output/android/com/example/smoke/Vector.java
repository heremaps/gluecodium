/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class Vector {
    public double x;
    public double y;
    public Vector(final double x, final double y) {
        Vector _other = create(x, y);
        this.x = _other.x;
        this.y = _other.y;
    }
    public Vector(@NonNull final Vector other) throws ValidationErrorException {
        Vector _other = create(other);
        this.x = _other.x;
        this.y = _other.y;
    }
    public native double distanceTo(@NonNull final Vector other);
    @NonNull
    public native Vector add(@NonNull final Vector other);
    public static native boolean validate(final double x, final double y);
    private static native Vector create(final double x, final double y);
    private static native Vector create(@NonNull final Vector other) throws ValidationErrorException;
}
