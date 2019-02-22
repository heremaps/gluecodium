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
import static junit.framework.Assert.assertFalse;
import static junit.framework.Assert.assertTrue;

import android.os.Build;

import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;
import java.util.List;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

class TestParentListener implements ParentListener {
  public boolean called = false;

  @Override
  public void listen() {
    called = true;
  }
}

class TestChildListener implements ChildListener {
  public boolean called = false;

  @Override
  public void listen() {
    called = true;
  }
}

class TestGrandChildListener extends TestChildListener {}

@RunWith(RobolectricTestRunner.class)
@Config(
  sdk = Build.VERSION_CODES.M,
  application = RobolectricApplication.class,
  constants = BuildConfig.class
)
public class InheritanceTest {

  @Test
  public void createChildClassInstance() {
    ChildClass instance = ChildClass.createChildClass();

    assertEquals("Johnny", instance.getName());
    assertEquals(7, instance.getLuckyNumber());
  }

  @Test
  public void castChildClassInstanceToParent() {
    ParentInterface instance = ChildClass.createChildClass().castToParent();

    assertEquals("Johnny", instance.getName());
    assertEquals(7, instance.getLuckyNumber());
  }

  @Test
  public void createGrandchildClassInstance() {
    GrandchildClass instance = GrandchildClass.createGrandchildClass();

    assertEquals("John F. Kimberly", instance.getName());
    assertEquals(42, instance.getLuckyNumber());
  }

  @Test
  @Ignore("TODO: APIGEN-1398, fix the underlying issue behind this flaky test and unignore it")
  public void castGrandchildClassInstanceToParent() {
    ParentInterface instance = GrandchildClass.createGrandchildClass().castToParent();

    assertEquals("John F. Kimberly", instance.getName());
    assertEquals(42, instance.getLuckyNumber());
  }

  @Test
  public void talkToParents() {

    TestParentListener parentListener = new TestParentListener();
    TestChildListener childListener = new TestChildListener();
    TestGrandChildListener grandChildListener = new TestGrandChildListener();

    List<ParentListener> parentListeners =
        java.util.Arrays.asList(parentListener, childListener, grandChildListener);

    Teacher.talkToParents(parentListeners);

    assertTrue(parentListener.called);
    assertTrue(childListener.called);
    assertTrue(grandChildListener.called);
  }

  private static boolean checkInheritance(Class<?> parent, Class<?> child) {
    return parent.isAssignableFrom(child);
  }

  @Test
  public void checkInheritanceRelationships() {
    // inheritance relationship check
    assertTrue(checkInheritance(RootInterface.class, ChildInterface.class));
    assertTrue(checkInheritance(RootInterface.class, AnotherChildInterface.class));

    assertTrue(checkInheritance(ChildInterface.class, ConcreteChild.class));
    assertTrue(checkInheritance(AnotherChildInterface.class, AnotherConcreteChild.class));

    assertTrue(checkInheritance(ConcreteChild.class, ConcreteGrandChild.class));
    assertTrue(checkInheritance(AnotherConcreteChild.class, AnotherConcreteGrandChild.class));

    // non inheritance relationship check
    assertFalse(checkInheritance(ChildInterface.class, AnotherChildInterface.class));
    assertFalse(checkInheritance(AnotherChildInterface.class, ChildInterface.class));

    assertFalse(checkInheritance(ChildInterface.class, AnotherConcreteGrandChild.class));
    assertFalse(checkInheritance(AnotherChildInterface.class, ConcreteGrandChild.class));
  }
}
