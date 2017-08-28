package com.example.here.hello.application;

/**
 * Main entry point
 */
public final class Application extends android.app.Application {
    @Override
    public void onCreate() {
        super.onCreate();
        System.loadLibrary("hello");
    }
}
