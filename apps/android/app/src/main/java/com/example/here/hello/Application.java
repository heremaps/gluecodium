package com.example.here.hello;

/**
 * Main entry point
 */
public final class Application extends android.app.Application {

    static {
        // For the time being, this is the best place to load the JNI library contained in
        // the APK.
        //System.loadLibrary("libhello_jni");
    }

    @Override
    public void onCreate() {
        super.onCreate();
    }
}
