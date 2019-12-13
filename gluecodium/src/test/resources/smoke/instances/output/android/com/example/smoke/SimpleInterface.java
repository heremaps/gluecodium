/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface SimpleInterface {
    @NonNull
    String getStringValue();
    @NonNull
    SimpleInterface useSimpleInterface(@NonNull final SimpleInterface input);
}
