/*
 * Copyright (C) 2016-2022 HERE Europe B.V.
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

import static junit.framework.Assert.assertFalse;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class NoCacheTest {

  class NoCacheImpl implements NoCacheInterface {
    @Override
    public void foo() {}
  }

  @Test
  public void noCacheInterfaceFromCpp() {
    NoCacheInterface instance1 = NoCacheHelper.getNoCacheInterface();
    NoCacheInterface instance2 = NoCacheHelper.getNoCacheInterface();

    boolean result = instance1 == instance2;

    assertFalse(result);
  }

  @Test
  public void noCacheInterfaceFromJava() {
    NoCacheInterface instance = new NoCacheImpl();

    boolean result = NoCacheHelper.compareNoCacheInterface(instance, instance);

    assertFalse(result);
  }
}
