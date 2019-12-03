/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
@FunctionalInterface
public interface StandaloneProducer {
    @NonNull
    String apply();
}
