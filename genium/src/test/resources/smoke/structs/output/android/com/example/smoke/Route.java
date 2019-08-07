/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public class Route {
    public static final String DEFAULT_DESCRIPTION = "Nonsense";
    public static final RouteType DEFAULT_TYPE = RouteType.EQUESTRIAN;
    @NonNull
    public String description;
    @NonNull
    public RouteType type;
    public Route(@NonNull final String description, @NonNull final RouteType type) {
        this.description = description;
        this.type = type;
    }
}