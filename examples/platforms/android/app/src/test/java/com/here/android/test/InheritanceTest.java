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
    constants = BuildConfig.class)
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

  @Test
  public void testChildAsParentReturnsSameType() {
    ChildClass child = ChildClass.createChildClass();
    ParentInterface parent = child.castToParent();

    assertTrue(parent instanceof ChildClass);
  }

  @Test
  public void testCreateChildAsParentSameType() {
    RootInterface rootInterface = InheritanceTestHelper.createChildAsRootInterface();
    assertTrue(rootInterface instanceof ChildInterface);
  }

  @Test
  public void testCreateConcreteChildAsChildInterfaceSameType() {
    ChildInterface childInterface = InheritanceTestHelper.createConcreteChildAsChildInterface();
    assertTrue(childInterface instanceof ConcreteChild);
  }

  @Test
  public void testCreateGrandchildAsChildSameType() {
    ConcreteChild child = InheritanceTestHelper.createGrandchildClassAsChildClass();

    assertTrue(child instanceof ConcreteGrandChild);
    ConcreteGrandChild grandchild = (ConcreteGrandChild) child;

    grandchild.setText("jump");

    assertEquals("jump", grandchild.getText());
  }

  // test C++ diamond inheritance
  @Test
  public void testCreateConjoinedChildrenAsChildInterface() {
    ChildInterface childInterface = InheritanceTestHelper.createConjoinedChildrenAsChildInterface();

    assertTrue(childInterface instanceof ConcreteChild);
    assertFalse(childInterface instanceof AnotherConcreteChild);
  }

  // test C++ diamond inheritance
  @Test
  public void testCreateConjoinedChildrenAsAnotherChildInterface() {
    AnotherChildInterface childInterface =
        InheritanceTestHelper.createConjoinedChildrenAsAnotherChildInterface();

    assertTrue(childInterface instanceof AnotherConcreteChild);
    assertFalse(childInterface instanceof ConcreteChild);
  }

  // test C++ multiple unrelated inheritance
  @Test
  public void testCreateDisjoinedChildrenAsParentInterface() {
    ParentInterface childInterface =
        InheritanceTestHelper.createDisjoinedChildrenAsParentInterface();

    assertTrue(childInterface instanceof ChildClass);
  }

  // test C++ multiple unrelated inheritance
  @Test
  public void testCreateDisjoinedChildrenAsRootInterface() {
    RootInterface childInterface = InheritanceTestHelper.createDisjoinedChildrenAsRootInterface();

    assertTrue(childInterface instanceof ConcreteChild);
  }

  @Test
  public void testFamilyListOfSubtypes() {
    List<RootInterface> family = InheritanceTestHelper.createFamilyList();

    assertEquals(6, family.size());
    assertTrue(family.get(0) instanceof ChildInterface);
    assertTrue(family.get(1) instanceof ConcreteChild);
    assertTrue(family.get(2) instanceof AnotherChildInterface);
    assertTrue(family.get(3) instanceof AnotherConcreteChild);
    assertTrue(family.get(4) instanceof ConcreteGrandChild);
    assertTrue(family.get(5) instanceof AnotherConcreteGrandChild);
  }
}
