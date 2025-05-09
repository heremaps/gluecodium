/*

 *
 */

@file:JvmName("Thermometer")

package com.example.smoke

import com.example.NativeBase
import com.example.time.Duration

class Thermometer : NativeBase {

    enum class SomeThermometerErrorCode(private val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(1);
    }
    class NotificationException(@JvmField val error: String) : Exception(error.toString())


    class AnotherNotificationException(@JvmField val error: Thermometer.SomeThermometerErrorCode) : Exception(error.toString())



    constructor(interval: Duration, observers: MutableList<TemperatureObserver>) : this(makeWithDuration(interval, observers), null as Any?) {
        cacheThisInstance();
        notifyObservers(this, observers)
    }
    constructor(observers: MutableList<TemperatureObserver>) : this(makeWithoutDuration(observers), null as Any?) {
        cacheThisInstance();
        notifyObservers(this, observers)
    }
@Throws (Thermometer.NotificationException::class)    constructor(id: Int, observers: MutableList<TemperatureObserver>) : this(throwingMake(id, observers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, observers)
    }
    constructor(label: String, niceObservers: MutableList<TemperatureObserver>) : this(nothrowMake(label, niceObservers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, niceObservers)
    }
@Throws (Thermometer.AnotherNotificationException::class)    constructor(dummy: Boolean, observers: MutableList<TemperatureObserver>) : this(anotherThrowingMake(dummy, observers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, observers)
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
        @Throws (Thermometer.NotificationException::class) @JvmStatic external fun throwingMake(id: Int, observers: MutableList<TemperatureObserver>) : Long
        @JvmStatic external fun nothrowMake(label: String, niceObservers: MutableList<TemperatureObserver>) : Long
        @Throws (Thermometer.AnotherNotificationException::class) @JvmStatic external fun anotherThrowingMake(dummy: Boolean, observers: MutableList<TemperatureObserver>) : Long
        @JvmStatic external fun notifyObservers(thermometer: Thermometer, someObservers: MutableList<TemperatureObserver>) : Unit
        @Throws (Thermometer.NotificationException::class) @JvmStatic external fun throwingNotifyObservers(thermometer: Thermometer, someObservers: MutableList<TemperatureObserver>) : Unit
    }
}
