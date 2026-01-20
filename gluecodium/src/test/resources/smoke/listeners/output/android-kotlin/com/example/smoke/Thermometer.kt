/*

 *
 */

@file:JvmName("ThermometerExtensions")


package com.example.smoke

import com.example.NativeBase
import com.example.time.Duration

/**
 * A class, which reads temperature and updates observers according to the given interval.
 * "Subject" in observer design pattern.
 */
class Thermometer : NativeBase {

    /**
     * Some error code for thermometer.
     */
    enum class SomeThermometerErrorCode(@JvmField val value: Int) {
        ERROR_NONE(0),
        ERROR_FATAL(1);
    }
    /**
     * This error indicates problems with notification of observers.
     * May be thrown if observers cannot be notified.
     */
    class NotificationException(@JvmField val error: String) : Exception(error.toString())


    /**
     * This error indicates other problems with notification of observers.
     */
    class AnotherNotificationException(@JvmField val error: Thermometer.SomeThermometerErrorCode) : Exception(error.toString())



    /**
     * A constructor, which makes the thermometer with readout interval.
     * @param interval readout interval
     * @param observers observers of temperature changes
     */

    constructor(interval: Duration, observers: List<@JvmSuppressWildcards TemperatureObserver>) : this(makeWithDuration(interval, observers), null as Any?) {
        cacheThisInstance();
        notifyObservers(this, observers)
    }
    /**
     * A constructor, which makes the thermometer with default readout interval (1 second).
     * @param observers observers of temperature changes
     */

    constructor(observers: List<@JvmSuppressWildcards TemperatureObserver>) : this(makeWithoutDuration(observers), null as Any?) {
        cacheThisInstance();
        notifyObservers(this, observers)
    }
    /**
     * A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param id identification of this thermometer
     * @param observers observers of temperature changes
     * @throws Thermometer.NotificationException if identification number is invalid
     */

    @Throws(Thermometer.NotificationException::class)
    constructor(id: Int, observers: List<@JvmSuppressWildcards TemperatureObserver>) : this(throwingMake(id, observers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, observers)
    }
    /**
     * A non-throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param label some identification label
     * @param niceObservers observers of temperature changes
     * @throws Thermometer.NotificationException if notification of observers failed
     */

    @Throws(Thermometer.NotificationException::class)
    constructor(label: String, niceObservers: List<@JvmSuppressWildcards TemperatureObserver>) : this(nothrowMake(label, niceObservers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, niceObservers)
    }
    /**
     * A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param dummy some dummy boolean flag
     * @param observers observers of temperature changes
     * @throws Thermometer.AnotherNotificationException if some problem occurs
     * @throws Thermometer.NotificationException if notification of observers failed
     */

    @Throws(Thermometer.AnotherNotificationException::class, Thermometer.NotificationException::class)
    constructor(dummy: Boolean, observers: List<@JvmSuppressWildcards TemperatureObserver>) : this(anotherThrowingMake(dummy, observers), null as Any?) {
        cacheThisInstance();
        throwingNotifyObservers(this, observers)
    }

    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}

    private external fun cacheThisInstance()




    external fun forceUpdate() : Unit


    external fun getCelsius() : Double


    external fun getKelvin() : Double


    external fun getFahrenheit() : Double




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)

        @JvmStatic private external fun makeWithDuration(interval: Duration, observers: List<@JvmSuppressWildcards TemperatureObserver>) : Long

        @JvmStatic private external fun makeWithoutDuration(observers: List<@JvmSuppressWildcards TemperatureObserver>) : Long
        @Throws(Thermometer.NotificationException::class)
        @JvmStatic private external fun throwingMake(id: Int, observers: List<@JvmSuppressWildcards TemperatureObserver>) : Long

        @JvmStatic private external fun nothrowMake(label: String, niceObservers: List<@JvmSuppressWildcards TemperatureObserver>) : Long
        @Throws(Thermometer.AnotherNotificationException::class)
        @JvmStatic private external fun anotherThrowingMake(dummy: Boolean, observers: List<@JvmSuppressWildcards TemperatureObserver>) : Long


        @JvmStatic external fun notifyObservers(thermometer: Thermometer, someObservers: List<@JvmSuppressWildcards TemperatureObserver>) : Unit
        /**
         * Function used to notify observers.
         * @param thermometer subject that has changed state
         * @param someObservers observers to be notified
         * @throws Thermometer.NotificationException if notification of observers failed
         */
        @Throws(Thermometer.NotificationException::class)
        @JvmStatic external fun throwingNotifyObservers(thermometer: Thermometer, someObservers: List<@JvmSuppressWildcards TemperatureObserver>) : Unit
    }
}


