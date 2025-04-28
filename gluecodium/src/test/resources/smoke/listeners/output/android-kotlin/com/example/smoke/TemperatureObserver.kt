/*

 *
 */

@file:JvmName("TemperatureObserver")

package com.example.smoke


/**
 * Observer interface for monitoring changes in thermometer ("Observer of subject").
 */
interface TemperatureObserver {

    fun onTemperatureUpdate(thermometer: Thermometer) : Unit


}

