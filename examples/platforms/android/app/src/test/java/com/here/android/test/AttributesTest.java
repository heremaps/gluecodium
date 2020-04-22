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
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
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
    Attributes.ExampleStruct expectedStruct = new Attributes.ExampleStruct(2.71, null);

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

  @Test
  public void getCachedProperty() {
    final CachedProperties instance = new CachedProperties();

    assertEquals(0, instance.getCallCount());

    final List<String> result1 = instance.getCachedProperty();
    final List<String> result2 = instance.getCachedProperty();

    assertEquals(1, instance.getCallCount());

    assertNotNull(result1);
    assertEquals(2, result1.size());
    assertEquals("foo", result1.get(0));
    assertEquals("bar", result1.get(1));
  }

  @Test
  public void getStaticCachedProperty() {
    assertEquals(0, CachedProperties.getStaticCallCount());

    final byte[] result1 = CachedProperties.getStaticCachedProperty();
    final byte[] result2 = CachedProperties.getStaticCachedProperty();

    assertEquals(1, CachedProperties.getStaticCallCount());

    assertNotNull(result1);
    assertEquals(3, result1.length);
    assertEquals(0, result1[0]);
    assertEquals(1, result1[1]);
    assertEquals(2, result1[2]);
  }
}
