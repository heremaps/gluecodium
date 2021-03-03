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
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class)
public final class CppProxyWithComplexListenersTest {
  private static final byte[] image =
      ("      _.-'''''-._      \n"
              + "    .'  _     _  '.    \n"
              + "   /   (o)   (o)   \\  \n"
              + "  |                 |  \n"
              + "  |  \\          /  |  \n"
              + "  \\  '.       .'  /   \n"
              + "    '.  `'---'`  .'    \n"
              + "      '-._____.-'")
          .getBytes();

  @Test
  public void JavaNativeListenerHavingComplexInputParameters() {
    NamedPoint3D ptOne = new NamedPoint3D("zero point", new Point3D());

    NamedPoint3D ptTwo = new NamedPoint3D("intermediate point", new Point3D(10, 10, 10));

    NamedPoint3D ptThree = new NamedPoint3D("final destination", new Point3D(20, 20, 20));

    final AtomicReference<String> listenerLog = new AtomicReference<>();

    ComplexListener javaComplexListener =
        (distanceMetric, list, quality, bytes) -> {
          double val = distanceMetric.getLength(list);
          listenerLog.set(
              "Java-native listener called back to given cpp instance:\n"
                  + "\tfrom: "
                  + list.get(0).name
                  + " to: "
                  + list.get(list.size() - 1).name
                  + "\n"
                  + "\tquality: "
                  + quality
                  + "\tlength of trajectory (using manhattan distance metric): "
                  + val
                  + "\timage:\n"
                  + new String(bytes));
        };

    List<NamedPoint3D> trajectory = new ArrayList<>();

    trajectory.add(ptOne);
    trajectory.add(ptTwo);
    trajectory.add(ptThree);

    TrajectoryQuality trajectoryQuality = TrajectoryQuality.TRAJECTORY_AVERAGE;

    ComplexNotifier complexNotifier = ComplexListenerFactory.createComplexNotifier();

    complexNotifier.trajectoryCompleted(trajectory, trajectoryQuality, image, javaComplexListener);

    assertTrue(
        listenerLog
            .get()
            .contains(
                "Java-native listener called back to given cpp instance:\n"
                    + "\tfrom: zero point to: final destination\n"
                    + "\tquality: TRAJECTORY_AVERAGE\tlength of trajectory (using manhattan distance "
                    + "metric): 60.0\timage:\n"
                    + new String(image)));
  }
}
