package com.here.android.hello;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class CppProxyTest {

    private static final Calculator.Position START_POSITION = new Calculator.Position();
    private static final Calculator.Position END_POSITION = new Calculator.Position();
    private Calculator notifier;

    private static final CalculatorListener JAVA_LISTENER = new CalculatorListener() {
        @Override
        public void onCalculationResult(double v) {
            HelloWorldStaticLogger.append("calculation finished with result=" + v);
        }

        @Override
        public void onCalculationInBackgroundResult(double v) {
            HelloWorldStaticLogger.append("calculation in bg finished with result=" + v);
        }
    };

    @BeforeClass
    public static void setUpClass(){
        START_POSITION.x = 0;
        START_POSITION.y = 0;
        START_POSITION.z = 0;

        END_POSITION.x = 10000;
        END_POSITION.y = 10000;
        END_POSITION.z = 10000;
    }

    @Before
    public void setUp(){
        HelloWorldStaticLogger.clearLog();
        notifier = CalculatorFactory.createCalculator();
    }

    @Test
    public void callbackToJavaListener() {

        notifier.calculate(START_POSITION,END_POSITION, JAVA_LISTENER);

        assertTrue("Native Java listener was called on C++ side",
                HelloWorldStaticLogger.getLog()
                                      .contains("calculation finished with result=17320.508"));
    }

    @Test
    public void callbackToRegisteredJavaListener() {

        notifier.registerListener(JAVA_LISTENER);

        notifier.calculateInBackground(START_POSITION,END_POSITION);

        notifier.unregisterListener(JAVA_LISTENER);

        assertTrue("Registered native Java listener was called on C++ side",
                HelloWorldStaticLogger.getLog()
                                      .contains("calculation in bg finished with result=17320.508"));
    }
}
