package com.here.android.hello;

import android.os.Build;

import com.example.here.hello.BuildConfig;
import com.here.android.RobolectricApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants =
    BuildConfig.class)
public final class HelloWorldDefaultsTest {

  private static final HelloWorldDefaults.StructWithDefaults STRUCT_WITH_DEFAULTS = new
      HelloWorldDefaults.StructWithDefaults();

  private static boolean checkIfStructEqualsDefault(
      final HelloWorldDefaults.StructWithDefaults struct) {

    return struct.intField == 42 && struct.floatField == 3.14F && struct.boolField == true
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
