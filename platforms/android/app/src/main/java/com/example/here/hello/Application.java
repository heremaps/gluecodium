package com.example.here.hello;

/**
 * Main entry point
 */
public class Application extends android.app.Application {
    @Override
    public void onCreate() {
        super.onCreate();
        System.loadLibrary("hello");
    }
}
