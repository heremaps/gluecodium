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


    public Thermometer(@NonNull final Duration interval, @NonNull final List<TemperatureObserver> observers) {
        this(make(interval, observers), (Object)null);
        cacheThisInstance();
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


    private static native long make(@NonNull final Duration interval, @NonNull final List<TemperatureObserver> observers);


    public native void forceUpdate();


    public native double getCelsius();


    public native double getKelvin();


    public native double getFahrenheit();



}

