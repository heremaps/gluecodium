/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
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
package com.here.android.hello;

import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.example.here.hello.BuildConfig;
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
public final class HelloWorldDefaultsTest {

  private static final HelloWorldDefaults.StructWithDefaults STRUCT_WITH_DEFAULTS =
      new HelloWorldDefaults.StructWithDefaults();

  private static boolean checkIfStructEqualsDefault(
      final HelloWorldDefaults.StructWithDefaults struct) {

    return struct.intField == 42
        && struct.floatField == 3.14F
        && struct.boolField == true
        && struct.stringField.equals("some string")
        && struct.enumField == HelloWorldDefaults.SomeEnum.BAR_VALUE;
  }

  @Test
  public void checkJavaDefaults() {

    //act
    HelloWorldDefaults.StructWithDefaults myStruct = new HelloWorldDefaults.StructWithDefaults();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }

  @Test
  public void checkCppDefaults() {

    //act
    HelloWorldDefaults.StructWithDefaults myStruct = HelloWorldDefaults.getStructWithDefaults();

    //assert
    assertTrue(checkIfStructEqualsDefault(myStruct));
  }
}
