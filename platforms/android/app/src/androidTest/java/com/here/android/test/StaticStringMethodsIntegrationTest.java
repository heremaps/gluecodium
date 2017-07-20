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

import android.support.test.runner.AndroidJUnit4;

import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

@RunWith(AndroidJUnit4.class)
public final class StaticStringMethodsIntegrationTest {
    @Test
    public void returnInputString() {
        // Arrange
        String inputString = "Foo";

        // Act
        String returnedString = StaticStringMethodsTest.returnInputString(inputString);

        // Assert
        assertEquals(inputString, returnedString);
    }

    @Test
    public void concatenateStrings() {
        // Arrange
        String inputString1 = "Hello";
        String inputString2 = "World";

        // Act
        String returnedString = StaticStringMethodsTest.concatenateStrings(inputString1, inputString2);

        // Assert
        assertEquals(inputString1 + inputString2, returnedString);
    }

    @Test
    public void returnHelloString() {
        // Arrange, act
        String returnedString = StaticStringMethodsTest.returnHelloString();

        // Assert
        assertEquals("hello", returnedString);
    }


    @Test
    public void returnEmpty() {
        // Arrange, act
        String returnedString = StaticStringMethodsTest.returnEmpty();

        // Assert
        assertTrue(returnedString.isEmpty());
    }
}

