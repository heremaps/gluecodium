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


    public Thermometer(@NonNull final Duration interval, @NonNull final List<TemperatureObserver> observers) {
        this(makeWithDuration(interval, observers), (Object)null);
        cacheThisInstance();
        notifyObservers(this, observers);
    }


    public Thermometer(@NonNull final List<TemperatureObserver> observers) {
        this(makeWithoutDuration(observers), (Object)null);
        cacheThisInstance();
        notifyObservers(this, observers);
    }


    public Thermometer(final int id, @NonNull final List<TemperatureObserver> observers) throws Thermometer.NotificationException {
        this(throwingMake(id, observers), (Object)null);
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


    public static native void notifyObservers(@NonNull final Thermometer thermometer, @NonNull final List<TemperatureObserver> someObservers);


    public static native void throwingNotifyObservers(@NonNull final Thermometer thermometer, @NonNull final List<TemperatureObserver> someObservers) throws Thermometer.NotificationException;


    public native void forceUpdate();


    public native double getCelsius();


    public native double getKelvin();


    public native double getFahrenheit();



}

