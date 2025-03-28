/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;
import com.example.NativeBase;
import com.example.time.Duration;
import java.util.List;

/**
 * <p>A class, which reads temperature and updates observers according to the given interval.
 * &quot;Subject&quot; in observer design pattern.
 */
public final class Thermometer extends NativeBase {
    /**
     * <p>Some error code for thermometer.
     */
    public enum SomeThermometerErrorCode {
        ERROR_NONE(0),
        ERROR_FATAL(1);
        /**
         * @hidden
         */
        public final int value;

        SomeThermometerErrorCode(final int value) {
            this.value = value;
        }
    }
    /**
     * <p>This error indicates problems with notification of observers.
     * May be thrown if observers cannot be notified.
     */
    public static final class NotificationException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public NotificationException(final String error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final String error;
    }
    /**
     * <p>This error indicates other problems with notification of observers.
     */
    public static final class AnotherNotificationException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public AnotherNotificationException(final Thermometer.SomeThermometerErrorCode error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final Thermometer.SomeThermometerErrorCode error;
    }
    /**
     * <p>A constructor, which makes the thermometer with readout interval.
     * @param interval <p>readout interval
     * @param observers <p>observers of temperature changes
     */

    public Thermometer(@NonNull final Duration interval, @NonNull final List<TemperatureObserver> observers) {
        this(makeWithDuration(interval, observers), (Object)null);
        cacheThisInstance();
        notifyObservers(this, observers);
    }
    /**
     * <p>A constructor, which makes the thermometer with default readout interval (1 second).
     * @param observers <p>observers of temperature changes
     */

    public Thermometer(@NonNull final List<TemperatureObserver> observers) {
        this(makeWithoutDuration(observers), (Object)null);
        cacheThisInstance();
        notifyObservers(this, observers);
    }
    /**
     * <p>A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param id <p>identification of this thermometer
     * @param observers <p>observers of temperature changes
     * @throws Thermometer.NotificationException <p>if identification number is invalid
     */

    public Thermometer(final int id, @NonNull final List<TemperatureObserver> observers) throws Thermometer.NotificationException {
        this(throwingMake(id, observers), (Object)null);
        cacheThisInstance();
        throwingNotifyObservers(this, observers);
    }
    /**
     * <p>A non-throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param label <p>some identification label
     * @param niceObservers <p>observers of temperature changes
     * @throws Thermometer.NotificationException <p>if notification of observers failed
     */

    public Thermometer(@NonNull final String label, @NonNull final List<TemperatureObserver> niceObservers) throws Thermometer.NotificationException {
        this(nothrowMake(label, niceObservers), (Object)null);
        cacheThisInstance();
        throwingNotifyObservers(this, niceObservers);
    }
    /**
     * <p>A throwing constructor, which makes the thermometer with default readout interval (1 second).
     * @param dummy <p>some dummy boolean flag
     * @param observers <p>observers of temperature changes
     * @throws Thermometer.AnotherNotificationException <p>if some problem occurs
     * @throws Thermometer.NotificationException <p>if notification of observers failed
     */

    public Thermometer(final boolean dummy, @NonNull final List<TemperatureObserver> observers) throws Thermometer.AnotherNotificationException, Thermometer.NotificationException {
        this(anotherThrowingMake(dummy, observers), (Object)null);
        cacheThisInstance();
        throwingNotifyObservers(this, observers);
    }

    /**
     * For internal use only.
     * @hidden
     * @param nativeHandle The SDK nativeHandle instance.
     * @param dummy The SDK dummy instance.
     */
    protected Thermometer(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }

    private static native void disposeNativeHandle(long nativeHandle);
    private native void cacheThisInstance();


    private static native long makeWithDuration(@NonNull final Duration interval, @NonNull final List<TemperatureObserver> observers);

    private static native long makeWithoutDuration(@NonNull final List<TemperatureObserver> observers);

    private static native long throwingMake(final int id, @NonNull final List<TemperatureObserver> observers) throws Thermometer.NotificationException;

    private static native long nothrowMake(@NonNull final String label, @NonNull final List<TemperatureObserver> niceObservers);

    private static native long anotherThrowingMake(final boolean dummy, @NonNull final List<TemperatureObserver> observers) throws Thermometer.AnotherNotificationException;


    public static native void notifyObservers(@NonNull final Thermometer thermometer, @NonNull final List<TemperatureObserver> someObservers);

    /**
     * <p>Function used to notify observers.
     * @param thermometer <p>subject that has changed state
     * @param someObservers <p>observers to be notified
     * @throws Thermometer.NotificationException <p>if notification of observers failed
     */
    public static native void throwingNotifyObservers(@NonNull final Thermometer thermometer, @NonNull final List<TemperatureObserver> someObservers) throws Thermometer.NotificationException;


    public native void forceUpdate();


    public native double getCelsius();


    public native double getKelvin();


    public native double getFahrenheit();



}

