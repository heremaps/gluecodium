/*

 *
 */

package com.example.smoke

import com.example.NativeBase
import com.example.time.Duration

class Thermometer : NativeBase {


    constructor(interval: Duration, observers: MutableList<TemperatureObserver>) : this(makeWithDuration(interval, observers), null as Any?) {
        cacheThisInstance();
    }
    constructor(observers: MutableList<TemperatureObserver>) : this(makeWithoutDuration(observers), null as Any?) {
        cacheThisInstance();
    }

    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()


    external fun forceUpdate() : Unit
    external fun getCelsius() : Double
    external fun getKelvin() : Double
    external fun getFahrenheit() : Double




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic external fun makeWithDuration(interval: Duration, observers: MutableList<TemperatureObserver>) : Long
        @JvmStatic external fun makeWithoutDuration(observers: MutableList<TemperatureObserver>) : Long
        @JvmStatic internal external fun notifyObservers(self: Thermometer, observers: MutableList<TemperatureObserver>) : Unit
    }
}
