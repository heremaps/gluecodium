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
import static org.robolectric.ParameterizedRobolectricTestRunner.Parameters;

import android.os.Build;
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.ParameterizedRobolectricTestRunner;
import org.robolectric.annotation.Config;

class ChildInterfaceJavaImpl implements ChildInterface {

  public ChildInterfaceJavaImpl() {}

  protected String data;

  @Override
  public void rootMethod(String s) {
    data = "Java Child data is '" + s + "'";
  }

  @Override
  public String getData() {
    return data;
  }
}

class GrandChildInterfaceJavaImpl extends ChildInterfaceJavaImpl {

  public GrandChildInterfaceJavaImpl() {
    super();
  }

  @Override
  public void rootMethod(String s) {
    data = "Java GrandChild data is '" + s + "'";
  }

  @Override
  public String getData() {
    return data;
  }
}

class AnotherChildInterfaceJavaImpl implements AnotherChildInterface {

  public String data;

  public AnotherChildInterfaceJavaImpl() {
    this.data = "";
  }

  @Override
  public String getData() {
    return data;
  }

  @Override
  public void rootMethod(String s) {
    data = "Java AnotherChild data is '" + s + "'";
  }
}

@RunWith(ParameterizedRobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class InheritanceOverridingMethodTest {

  enum InstanceType {
    CHILD_INTERFACE_JAVA_IMPLEMENTATION,
    GRAND_CHILD_INTERFACE_JAVA_IMPLEMENTATION,
    ANOTHER_CHILD_INTERFACE_JAVA_IMPLEMENTATION,
    CHILD_INTERFACE_CPP_IMPLEMENTATION,
    ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION,
    CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
    ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
    CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION,
    ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION
  }

  private final InstanceType instanceType;
  private final String expectedData;

  private static final String data = "Custom data";

  public InheritanceOverridingMethodTest(
      final InstanceType instanceType, final String expectedData) {
    this.instanceType = instanceType;
    this.expectedData = expectedData;
  }

  @Parameters
  public static Collection<Object[]> testData() {
    return java.util.Arrays.asList(
        new Object[][] {
          {InstanceType.CHILD_INTERFACE_JAVA_IMPLEMENTATION, "Java Child data is 'Custom data'"},
          {
            InstanceType.GRAND_CHILD_INTERFACE_JAVA_IMPLEMENTATION,
            "Java GrandChild data is 'Custom data'"
          },
          {
            InstanceType.ANOTHER_CHILD_INTERFACE_JAVA_IMPLEMENTATION,
            "Java AnotherChild data is 'Custom data'"
          },
          {InstanceType.CHILD_INTERFACE_CPP_IMPLEMENTATION, "C++ Child data is 'Custom data'"},
          {
            InstanceType.ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION,
            "C++ AnotherChild data is 'Custom data'"
          },
          {
            InstanceType.CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
            "C++ ConcreteChild data is 'Custom data'"
          },
          {
            InstanceType.ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION,
            "C++ AnotherConcreteChild data is 'Custom data'"
          },
          {
            InstanceType.CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION,
            "C++ ConcreteGrandChild data is 'Custom data'"
          },
          {
            InstanceType.ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION,
            "C++ AnotherConcreteGrandChild data is 'Custom data'"
          }
        });
  }

  // Instance creation has to be delayed until test run because we need to wait until the shared
  // library is loaded. that's why we reference instances in test parameters by just an enum entry
  // that will be used to create the native object using native factory methods. i.e:
  // InheritanceTestHelper.createChild()
  private RootInterface createInstance(InstanceType type) {
    switch (type) {
      case CHILD_INTERFACE_JAVA_IMPLEMENTATION:
        return new ChildInterfaceJavaImpl();

      case GRAND_CHILD_INTERFACE_JAVA_IMPLEMENTATION:
        return new GrandChildInterfaceJavaImpl();

      case ANOTHER_CHILD_INTERFACE_JAVA_IMPLEMENTATION:
        return new AnotherChildInterfaceJavaImpl();

      case CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createChild();

      case ANOTHER_CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createAnotherChild();

      case CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createConcreteChild();

      case ANOTHER_CONCRETE_CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createAnotherConcreteChild();

      case CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createConcreteGrandChild();

      case ANOTHER_CONCRETE_GRAND_CHILD_INTERFACE_CPP_IMPLEMENTATION:
        return InheritanceTestHelper.createAnotherConcreteGrandChild();

      default:
        return null;
    }
  }

  private String getData(RootInterface instance) {
    if (instance instanceof ChildInterface) {
      return ((ChildInterface) instance).getData();
    }

    if (instance instanceof AnotherChildInterface) {
      return ((AnotherChildInterface) instance).getData();
    }

    return null;
  }

  @Test
  public void checkOverriddenMethodCalledFromCpp() {
    RootInterface instance = createInstance(instanceType);
    InheritanceTestHelper.callRootMethod(instance, data);
    assertEquals(expectedData, getData(instance));
  }

  @Test
  public void checkOverriddenMethodCalledFromJava() {
    RootInterface instance = createInstance(instanceType);
    instance.rootMethod(data);
    assertEquals(expectedData, getData(instance));
  }
}
