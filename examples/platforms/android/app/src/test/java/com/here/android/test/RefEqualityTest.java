/*
 * Copyright (C) 2016-2020 HERE Europe B.V.
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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.os.Build;
import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.Collections;
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
public final class RefEqualityTest {

  @Test
  public void refEqualityPreservedForClass() {
    DummyClass instance1 = DummyFactory.getDummyClassSingleton();
    DummyClass instance2 = DummyFactory.getDummyClassSingleton();

    assertTrue(instance1 == instance2);
  }

  @Test
  public void refInequalityPreservedForClass() {
    DummyClass instance1 = DummyFactory.getDummyClassSingleton();
    DummyClass instance2 = DummyFactory.createDummyClass();

    assertFalse(instance1 == instance2);
  }

  @Test
  public void refEqualityPreservedForInterface() {
    DummyInterface instance1 = DummyFactory.getDummyInterfaceSingleton();
    DummyInterface instance2 = DummyFactory.getDummyInterfaceSingleton();

    assertTrue(instance1 == instance2);
  }

  @Test
  public void refInequalityPreservedForInterface() {
    DummyInterface instance1 = DummyFactory.getDummyInterfaceSingleton();
    DummyInterface instance2 = DummyFactory.createDummyInterface();

    assertFalse(instance1 == instance2);
  }

  @Test
  public void refEqualityPreservedForClassConstructor() {
    DummyClass instance1 = new DummyClass();
    DummyClass instance2 = DummyClass.dummyClassRoundTrip(instance1);

    assertTrue(instance1 == instance2);
  }

  @Test
  public void refInequalityPreservedForClassConstructor() {
    DummyClass instance1 = new DummyClass();
    DummyClass instance2 = new DummyClass();

    assertFalse(instance1 == instance2);
  }

  @Test
  public void refEqualityPreservedForClassInList() {
    List<DummyClass> list = Collections.singletonList(new DummyClass());

    List<DummyClass> result = DummyClass.dummyClassListRoundTrip(list);

    assertTrue(list.get(0) == result.get(0));
  }
}
