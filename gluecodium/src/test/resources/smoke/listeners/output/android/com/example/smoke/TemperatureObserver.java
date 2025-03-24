/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>Observer interface for monitoring changes in thermometer (&quot;Observer of subject&quot;).
 */
public interface TemperatureObserver {

    void onTemperatureUpdate(@NonNull final Thermometer thermometer);
}

