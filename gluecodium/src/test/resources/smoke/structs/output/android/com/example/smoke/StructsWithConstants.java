/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class StructsWithConstants {
    public static final class Route {
        public static final String DEFAULT_DESCRIPTION = "Nonsense";
        public static final RouteUtils.RouteType DEFAULT_TYPE = RouteUtils.RouteType.EQUESTRIAN;
        @NonNull
        public String description;
        @NonNull
        public RouteUtils.RouteType type;
        public Route(@NonNull final String description, @NonNull final RouteUtils.RouteType type) {
            this.description = description;
            this.type = type;
        }
    }
}
