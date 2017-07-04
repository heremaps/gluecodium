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

import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;
import com.here.android.test.StaticStringMethodsTest;
import org.junit.Test;
import org.junit.runner.RunWith;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertTrue;

@RunWith(AndroidJUnit4.class)
@SmallTest
public class StaticStringMethodsFunctionalTest {

  private final StaticStringMethodsTest staticStringMethodsTest = new StaticStringMethodsTest();

  @Test
  public void returnInputString() {
    String inputString = "Foo";

    String returnedString = staticStringMethodsTest.returnInputString(inputString);

    assertEquals(inputString, returnedString);
  }

  @Test
  public void concatenateStrings() {
    String inputString1 = "Hello";
    String inputString2 = "World";

    String returnedString = staticStringMethodsTest.concatenateStrings(inputString1, inputString2);

    assertEquals(inputString1 + inputString2, returnedString);
  }

  @Test
  public void returnHelloString() {
    String returnedString = staticStringMethodsTest.returnHelloString();

    assertEquals("hello", returnedString);
  }


  @Test
  public void returnEmpty() {
    String returnedString = staticStringMethodsTest.returnEmpty();

    assertTrue(returnedString.isEmpty());
  }
}

