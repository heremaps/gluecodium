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

import static junit.framework.Assert.assertTrue;

import android.os.Build;
import com.here.android.RobolectricApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public class ListenerInheritanceTest {

  public boolean called;

  private final ParentListener fakeParentListener =
      new ParentListener() {
        @Override
        public void listen() {
          called = true;
        }
      };

  private final ChildListener fakeChildListener =
      new ChildListener() {
        @Override
        public void listen() {
          called = true;
        }
      };

  @Test
  public void talkToParent() {
    Talker.talkToParent(fakeParentListener);

    assertTrue(called);
  }

  @Test
  public void talkToChild() {
    Talker.talkToChild(fakeChildListener);

    assertTrue(called);
  }

  @Test
  public void talkToChildAsParent() {
    Talker.talkToParent(fakeChildListener);

    assertTrue(called);
  }

  @Test
  public void addRemoveParentListener() {
    Broadcaster caster = new Broadcaster();
    caster.addParentListener(fakeParentListener);

    boolean result = caster.removeListener(fakeParentListener);

    assertTrue(result);
  }

  @Test
  public void addRemoveChildListener() {
    Broadcaster caster = new Broadcaster();
    caster.addChildListener(fakeChildListener);

    boolean result = caster.removeListener(fakeChildListener);

    assertTrue(result);
  }
}
