package com.here.android.test;


import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;
import com.here.android.another.*;

import com.here.android.matchers.FieldMatcher;
import java.lang.reflect.Field;
import org.hamcrest.FeatureMatcher;
import org.hamcrest.Matcher;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.hamcrest.Matchers.equalTo;
import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public class ErrorsTest {

    @Rule public final ExpectedException expectedException = ExpectedException.none();

    @Test
    public void methodWithError_throws() throws InternalErrorsException {
        expectedException.expect(InternalErrorsException.class);
        expectedException.expect(FieldMatcher.hasFieldWithValue("error", Errors.InternalErrors.CRASHED));

        Errors.methodWithError(true);
    }

    @Test
    public void methodWithError_doesNotThrow() throws InternalErrorsException {
        Errors.methodWithError(false);
    }

    @Test
    public void methodWithErrorAndString_throws() throws ExternalErrorsException {
        expectedException.expect(ExternalErrorsException.class);
        expectedException.expect(FieldMatcher.hasFieldWithValue("error", AdditionalErrors.ExternalErrors.FAILED));

        Errors.methodWithErrorAndString(true);
    }

    @Test
    public void methodWithErrorAndString_doesNotThrow() throws ExternalErrorsException {
        String result = Errors.methodWithErrorAndString(false);

        assertEquals("SUCCEEDED", result);
    }

    @Test
    public void methodThatExplodes_throws() throws ExplosiveErrorsException {
        expectedException.expect(ExplosiveErrorsException.class);
        expectedException.expect(FieldMatcher.hasFieldWithValue("error", ExplosiveErrors.EXPLODED));

        Errors.methodThatExplodes(true);
    }

    @Test
    public void methodThatExplodes_doesNotThrow() throws ExplosiveErrorsException {
        byte[] result = Errors.methodThatExplodes(false);

        assertEquals(0, result[0]);
        assertEquals(1, result[1]);
        assertEquals(2, result[2]);
    }

    @Test
    public void methodWithGoodAndBad_throws() throws YetAnotherErrorsException {
        expectedException.expect(YetAnotherErrorsException.class);
        expectedException.expect(FieldMatcher.hasFieldWithValue("error", YetAnotherErrors.BAD));

        Errors.methodWithGoodAndBad(true);
    }

    @Test
    public void methodWithGoodAndBad_doesNotThrow() throws YetAnotherErrorsException {
        SomeEnum result = Errors.methodWithGoodAndBad(false);

        assertEquals(SomeEnum.ANOTHER_RESULT, result);
    }
}
