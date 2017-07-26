/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android.test;

import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;

import com.here.android.hello.HelloWorld;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
@SmallTest
public final class HelloWorldIntegrationTest {
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
    @Ignore("Enable once APIGEN-397 is solved")
    public void helloWorldMethod_Null() {
        // Arrange, act
        String result = HelloWorld.helloWorldMethod(null);

        // Assert
        assertEquals(HELLO_PREFIX, result);
    }
}

