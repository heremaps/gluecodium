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
    private static final byte[] image = (
            "      _.-'''''-._      \n" +
            "    .'  _     _  '.    \n" +
            "   /   (o)   (o)   \\  \n" +
            "  |                 |  \n" +
            "  |  \\          /  |  \n" +
            "  \\  '.       .'  /   \n" +
            "    '.  `'---'`  .'    \n" +
            "      '-._____.-'").getBytes();

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

        ComplexListener javaComplexListener = (distanceMetric, list, quality, bytes) -> {
            double val = distanceMetric.getLength(list);
            listenerLog.set("Java-native listener called back to given cpp instance:\n" +
                    "\tfrom: " + list.get(0).name + " to: " + list.get(list.size() - 1).name + "\n" +
                    "\tquality: " + quality +
                    "\tlength of trajectory (using manhattan distance metric): " + val +
                    "\timage:\n" + new String(bytes));
        };

        List<NamedPoint3D> trajectory = new ArrayList<>();

        trajectory.add(ptOne);
        trajectory.add(ptTwo);
        trajectory.add(ptThree);

        TrajectoryQuality trajectoryQuality = TrajectoryQuality.TRAJECTORY_AVERAGE;

        ComplexNotifier complexNotifier = ComplexListenerFactory.createComplexNotifier();

        complexNotifier.trajectoryCompleted(trajectory, trajectoryQuality, image, javaComplexListener);

        assertTrue(
                listenerLog.get()
                        .contains("Java-native listener called back to given cpp instance:\n" +
                                "\tfrom: zero point to: final destination\n" +
                                "\tquality: TRAJECTORY_AVERAGE\tlength of trajectory (using manhattan distance "
                                + "metric): 60.0\timage:\n"
                                + new String(image)));
    }
}