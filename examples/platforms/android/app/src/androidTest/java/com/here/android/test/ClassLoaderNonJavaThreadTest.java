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

import static junit.framework.Assert.assertNotNull;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;

import org.junit.Test;

/** These tests need to be run on the device since they will always pass on emulator. */
public class ClassLoaderNonJavaThreadTest {
  class ClassLoaderListener implements ThreadedListener {

    @Override
    public long onEvent(String message) {
      assertNull(Thread.currentThread().getContextClassLoader());
      return Thread.currentThread().getId();
    }

    @Override
    public void unloaded(UnloadedClass unloaded) {
      assertNotNull(unloaded);
      assertEquals(1, unloaded.increment((short) 0));
    }
  }

  @Test
  public void testMultipleRoundTripsWithClassLoading() {
    ThreadedNotifier notifier = new ThreadedNotifier();

    ClassLoaderListener listener = new ClassLoaderListener();

    long response = notifier.notify(listener, "foo");

    assertFalse(Thread.currentThread().getId() == response);
  }
}
