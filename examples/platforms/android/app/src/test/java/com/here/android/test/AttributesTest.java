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
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class AttributesTest {

  private final Attributes attributes = new Attributes();

  @Test
  public void setGetBuiltInTypeAttribute() {
    attributes.setBuiltInTypeAttribute((long) 42);

    assertEquals((long) 42, attributes.getBuiltInTypeAttribute());
  }

  @Test
  public void getReadonlyAttribute() {
    assertEquals(3.14f, attributes.getReadonlyAttribute());
  }

  @Test
  public void setGetStructAttribute() {
    Attributes.ExampleStruct expectedStruct = new Attributes.ExampleStruct();
    expectedStruct.value = 2.71;

    attributes.setStructAttribute(expectedStruct);
    Attributes.ExampleStruct result = attributes.getStructAttribute();

    assertNotNull(result);
    assertEquals(expectedStruct.value, result.value);
  }

  @Test
  public void setGetStaticAttribute() {
    Attributes.setStaticAttribute("fooBar");

    assertEquals("fooBar", Attributes.getStaticAttribute());
  }
}
