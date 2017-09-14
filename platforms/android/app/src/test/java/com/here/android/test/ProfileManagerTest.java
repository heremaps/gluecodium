package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldProfileManagerFactory;
import com.here.android.hello.ProfileManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class ProfileManagerTest {
    private static final String PROFILE_NAME = "ProfileName";
    private static final String CHANGED_PROFILE_NAME = "ChangedProfileName";

    @Test
    public void createProfileManagerInstance() {
        ProfileManager profileManagerInstance = HelloWorldProfileManagerFactory.createProfileManagerInstance();

        assertNotNull(profileManagerInstance);
    }

    @Test
    public void changeProfile() {
        ProfileManager profileManagerInstance = HelloWorldProfileManagerFactory.createProfileManagerInstance();
        profileManagerInstance.createProfile(PROFILE_NAME);

        String oldProfileName = profileManagerInstance.changeProfile(CHANGED_PROFILE_NAME);

        assertEquals(PROFILE_NAME, oldProfileName);
    }

    @Test
    public void deleteProfile() {
        ProfileManager profileManagerInstance = HelloWorldProfileManagerFactory.createProfileManagerInstance();
        profileManagerInstance.createProfile(PROFILE_NAME);

        profileManagerInstance.deleteProfile();

        String profileNameAfterDelete = profileManagerInstance.changeProfile(PROFILE_NAME);
        assertEquals("", profileNameAfterDelete);
    }
}
