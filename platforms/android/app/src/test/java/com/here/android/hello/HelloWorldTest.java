package com.here.android.hello;

import android.os.Build;

import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.junit.Assert.assertEquals;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class HelloWorldTest {
    private static final String HELLO_PREFIX = "Hello ";

    @Test
    public void helloWorldMethod_String() {
        // Arrange
        String input = "User";

        // Act
        String result = HelloWorld.helloWorldMethod(input);

        // Assert
        assertEquals(HELLO_PREFIX + input, result);
    }

    @Test
    public void helloWorldMethod_EmptyString() {
        // Arrange, act
        String result = HelloWorld.helloWorldMethod("");

        // Assert
        assertEquals(HELLO_PREFIX, result);
    }


    @Test
    public void helloWorldMethod_Null() {
        // Arrange, act
        String result = HelloWorld.helloWorldMethod(null);

        // Assert
        assertEquals(HELLO_PREFIX, result);
    }
}
