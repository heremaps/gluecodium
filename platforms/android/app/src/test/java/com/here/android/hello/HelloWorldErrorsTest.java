package com.here.android.hello;

import static junit.framework.Assert.assertEquals;

import android.os.Build;
import android.support.compat.BuildConfig;
import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldErrors.InternalErrors;
import com.here.android.matchers.FieldMatcher;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants =
    BuildConfig.class)
public class HelloWorldErrorsTest {

  @Rule
  public ExpectedException expectedException = ExpectedException.none();

  @Test
  public void helloWorldMethodWithError_throwsCrashed() throws InternalErrorsException {
    expectedException.expect(InternalErrorsException.class);
    expectedException.expectMessage(Integer.toString(InternalErrors.CRASHED.value));
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrors.CRASHED));

    HelloWorldErrors.helloWorldMethodWithError(true);
  }

  @Test
  public void helloWorldMethodWithError_doesNotThrow() throws InternalErrorsException {
    HelloWorldErrors.helloWorldMethodWithError(false);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_throwsCrashed() throws InternalErrorsException {
    expectedException.expect(InternalErrorsException.class);
    expectedException.expectMessage(Integer.toString(InternalErrors.CRASHED.value));
    expectedException.expect(FieldMatcher.hasFieldWithValue("error", InternalErrors.CRASHED));

    HelloWorldErrors.helloWorldMethodWithErrorAndString(true);
  }

  @Test
  public void helloWorldMethodWithErrorAndString_doesNotThrow() throws InternalErrorsException {
    String result = HelloWorldErrors.helloWorldMethodWithErrorAndString(false);

    assertEquals("Hello!", result);
  }
}
