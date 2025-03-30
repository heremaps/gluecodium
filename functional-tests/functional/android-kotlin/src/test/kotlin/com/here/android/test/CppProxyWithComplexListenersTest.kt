/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.RobolectricApplication
import java.util.concurrent.atomic.AtomicReference
import org.junit.runner.RunWith
import org.junit.Assert.assertTrue
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class CppProxyWithComplexListenersTest {

    @org.junit.Test
    fun kotlinNativeListenerHavingComplexInputParameters() {
        val ptOne: NamedPoint3D = NamedPoint3D("zero point", Point3D())
        val ptTwo: NamedPoint3D = NamedPoint3D("intermediate point", Point3D(10.0, 10.0, 10.0))
        val ptThree: NamedPoint3D = NamedPoint3D("final destination", Point3D(20.0, 20.0, 20.0))

        val listenerLog: AtomicReference<String> = AtomicReference<String>()

        val kotlinComplexListener: ComplexListener = object: ComplexListener {
            override fun onTrajectoryCompleted(
                distanceMetric: DistanceMetric,
                trajectory: MutableList<NamedPoint3D>,
                quality: TrajectoryQuality,
                image: ByteArray,
            ) {
                val headerStr = "Kotlin-native listener called back to given cpp instance:\n"
                val fromToStr = "\tfrom: ${trajectory[0].name} to: ${trajectory[trajectory.lastIndex].name}\n"
                val qualityStr = "\tquality: $quality\n"
                val length: Double = distanceMetric.getLength(trajectory)
                val lengthStr = "\tlength of trajectory (using manhattan distance metric): $length\n"
                val imageStr = "\timage:\n${String(image)}"

                listenerLog.set("${headerStr}${fromToStr}${qualityStr}${lengthStr}${imageStr}")
            }
        }

        val trajectory: MutableList<NamedPoint3D> = mutableListOf(ptOne, ptTwo, ptThree)
        val trajectoryQuality: TrajectoryQuality = TrajectoryQuality.TRAJECTORY_AVERAGE

        val complexNotifier: ComplexNotifier = ComplexListenerFactory.createComplexNotifier()
        complexNotifier.trajectoryCompleted(trajectory, trajectoryQuality, image, kotlinComplexListener)

        assertTrue(listenerLog.get().contains(
                    ("Kotlin-native listener called back to given cpp instance:\n"
                            + "\tfrom: zero point to: final destination\n"
                            + "\tquality: TRAJECTORY_AVERAGE\n"
                            + "\tlength of trajectory (using manhattan distance metric): 60.0\n"
                            + "\timage:\n"
                            + String(image))
                )
        )
    }

    companion object {
        val image: ByteArray =
(("""      _.-'''''-._      
    .'  _     _  '.    
   /   (o)   (o)   \  
  |                 |  
  |  \          /  |  
  \  '.       .'  /   
    '.  `'---'`  .'    
      '-._____.-'"""))
                .toByteArray()
    }
}