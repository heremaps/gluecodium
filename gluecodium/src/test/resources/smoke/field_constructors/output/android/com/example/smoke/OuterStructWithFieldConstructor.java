/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class OuterStructWithFieldConstructor {
    @NonNull
    public OuterStructWithFieldConstructor.InnerStructWithDefaults outerStructField;
    public static final class InnerStructWithDefaults {
        public double innerStructField;
        public InnerStructWithDefaults() {
            this.innerStructField = 1.0;
        }
    }
    public OuterStructWithFieldConstructor(@NonNull final OuterStructWithFieldConstructor.InnerStructWithDefaults outerStructField) {
        this.outerStructField = outerStructField;
    }
}
