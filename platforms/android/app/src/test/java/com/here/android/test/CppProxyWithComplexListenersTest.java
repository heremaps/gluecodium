package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants =
        BuildConfig.class)
public final class CppProxyWithComplexListenersTest {

    @Test
    public void JavaNativeListenerHavingComplexInputParameters() {

        NamedPoint3D ptOne = new NamedPoint3D();
        ptOne.name = "zero point";
        ptOne.pt.x = 0;
        ptOne.pt.y = 0;
        ptOne.pt.z = 0;

        NamedPoint3D ptTwo = new NamedPoint3D();
        ptTwo.name = "intermediate point";
        ptTwo.pt.x = 10;
        ptTwo.pt.y = 10;
        ptTwo.pt.z = 10;

        NamedPoint3D ptThree = new NamedPoint3D();
        ptThree.name = "final destination";
        ptThree.pt.x = 20;
        ptThree.pt.y = 20;
        ptThree.pt.z = 20;

        final AtomicReference<String> listenerLog = new AtomicReference<>();

        ComplexListener javaComplexListener = new ComplexListener() {
            @Override
            public void onTrajectoryCompleted(DistanceMetric distanceMetric, List<NamedPoint3D> list) {

                double val = distanceMetric.getLength(list);
                listenerLog.set("Java-native listener called back to given cpp instance:\n" +
                        "\tfrom: " + list.get(0).name + " to: " + list.get(list.size() - 1).name + "\n" +
                        "\tlength of trajectory (using manhattan distance metric): " + val);
            }
        };

        List<NamedPoint3D> trajectory = new ArrayList<>();

        trajectory.add(ptOne);
        trajectory.add(ptTwo);
        trajectory.add(ptThree);

        ComplexNotifier complexNotifier = ComplexListenerFactory.createComplexNotifier();

        complexNotifier.trajectoryCompleted(trajectory, javaComplexListener);

        assertTrue(
                listenerLog.get()
                        .contains("Java-native listener called back to given cpp instance:\n" +
                                "\tfrom: zero point to: final destination\n" +
                                "\tlength of trajectory (using manhattan distance metric): 60.0"));
    }
}