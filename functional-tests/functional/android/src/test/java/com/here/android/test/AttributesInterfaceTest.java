/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */
package com.here.android.test;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class AttributesInterfaceTest {

  private final AttributesInterface attributes =
      AttributesInterfaceFactory.createAttributesInterface();

  @Test
  public void setGetBuiltInTypeAttribute() {
    final long value = 42;

    attributes.setBuiltInTypeAttribute(value);
    long result = attributes.getBuiltInTypeAttribute();

    assertEquals(value, result);
  }

  @Test
  public void setGetStructAttribute() {
    AttributesInterface.ExampleStruct structValue = new AttributesInterface.ExampleStruct();
    structValue.value = 2.71;

    attributes.setStructAttribute(structValue);
    AttributesInterface.ExampleStruct result = attributes.getStructAttribute();

    assertNotNull(result);
    assertEquals(structValue.value, result.value);
  }

  @Test
  public void setGetStaticAttributes() {
    assertEquals(AttributesInterface.LABEL, "SOME CONSTANT LABEL");
    assertEquals(AttributesInterface.getSomeStaticProperty(), "MY STATIC PROPERTY");

    AttributesInterface.setSomeStaticProperty("NEW VALUE OF PROPERTY");
    assertEquals(AttributesInterface.getSomeStaticProperty(), "NEW VALUE OF PROPERTY");
  }
}
