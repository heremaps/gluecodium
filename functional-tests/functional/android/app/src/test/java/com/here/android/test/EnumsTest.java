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

import android.os.Build;
import com.here.android.RobolectricApplication;
import com.here.gluecodium.test.functional.BuildConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(
    sdk = Build.VERSION_CODES.M,
    application = RobolectricApplication.class,
    constants = BuildConfig.class)
public class EnumsTest {

  @Test
  public void flipEnumTC() {
    InternalErrorTypeCollection errorEnum = InternalErrorTypeCollection.ERROR_FATAL;
    assertEquals(
        InternalErrorTypeCollection.ERROR_NONE,
        EnumsTypeCollectionMethods.flipEnumValue(errorEnum));
  }

  @Test
  public void flipEnum() {
    Enums.InternalError errorEnum = Enums.InternalError.ERROR_FATAL;
    assertEquals(Enums.InternalError.ERROR_NONE, Enums.flipEnumValue(errorEnum));
  }

  @Test
  public void extractEnumFromStruct() {
    Enums.ErrorStruct errorStruct = new Enums.ErrorStruct();
    errorStruct.type = Enums.InternalError.ERROR_NONE;
    assertEquals(Enums.InternalError.ERROR_FATAL, Enums.extractEnumFromStruct(errorStruct));
  }

  @Test
  public void extractEnumFromStructTC() {
    ErrorStructTypeCollection errorStruct = new ErrorStructTypeCollection();
    errorStruct.type = InternalErrorTypeCollection.ERROR_NONE;
    assertEquals(
        InternalErrorTypeCollection.ERROR_FATAL,
        EnumsTypeCollectionMethods.extractEnumFromStruct(errorStruct));
  }

  @Test
  public void createStructWithEnumInside() {
    String message = "myMessage";
    Enums.ErrorStruct result =
        Enums.createStructWithEnumInside(Enums.InternalError.ERROR_FATAL, message);

    assertEquals(Enums.InternalError.ERROR_NONE, result.type);
    assertEquals(message, result.message);
  }

  @Test
  public void createStructWithEnumInsideTC() {
    String message = "myMessage";
    ErrorStructTypeCollection result =
        EnumsTypeCollectionMethods.createStructWithEnumInside(
            InternalErrorTypeCollection.ERROR_FATAL, message);

    assertEquals(InternalErrorTypeCollection.ERROR_NONE, result.type);
    assertEquals(message, result.message);
  }
}
