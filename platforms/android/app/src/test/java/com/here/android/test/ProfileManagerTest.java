package com.here.android.test;

import android.os.Build;
import android.support.compat.BuildConfig;

import com.here.android.RobolectricApplication;
import com.here.android.hello.HelloWorldProfileManagerFactory;
import com.here.android.hello.HelloWorldStaticLogger;
import com.here.android.hello.ProfileManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.lang.ref.WeakReference;

import static junit.framework.Assert.assertEquals;
import static junit.framework.Assert.assertNotNull;
import static junit.framework.Assert.assertTrue;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = Build.VERSION_CODES.M, application = RobolectricApplication.class, constants = BuildConfig.class)
public final class ProfileManagerTest {
    private static final String PROFILE_NAME = "ProfileName";
    private static final String CHANGED_PROFILE_NAME = "ChangedProfileName";
    private static final int MAX_GC_ATTEMPTS = 15;
    private static final String PROFILE_MANAGER_DESTRUCTOR_LOG = "ProfileManager::destructor";

    private WeakReference<ProfileManager> profileManagerWeakReference = null;

    @Test
    public void createProfileManagerInstance() {
        ProfileManager profileManagerInstance =
                HelloWorldProfileManagerFactory.createProfileManagerInstance();

        assertNotNull(profileManagerInstance);
    }

    @Test
    public void changeProfile() {
        ProfileManager profileManagerInstance =
                HelloWorldProfileManagerFactory.createProfileManagerInstance();
        profileManagerInstance.createProfile(PROFILE_NAME);

        String oldProfileName = profileManagerInstance.changeProfile(CHANGED_PROFILE_NAME);

        assertEquals(PROFILE_NAME, oldProfileName);
    }

    @Test
    public void deleteProfile() {
        ProfileManager profileManagerInstance =
                HelloWorldProfileManagerFactory.createProfileManagerInstance();
        profileManagerInstance.createProfile(PROFILE_NAME);

        profileManagerInstance.deleteProfile();

        String profileNameAfterDelete = profileManagerInstance.changeProfile(PROFILE_NAME);
        assertEquals("", profileNameAfterDelete);
    }

    @Test
    public void createProfileManagerInstance_andDisposeIt() throws InterruptedException {
        HelloWorldStaticLogger.clearLog();

        // This thread is created to have a local scoped ProfileManager variable
        // which is available for garbage collection after run() finishes
        Thread profileManagerScope = new Thread(() -> {
            ProfileManager profileManager =
                    HelloWorldProfileManagerFactory.createProfileManagerInstance();
            profileManagerWeakReference = new WeakReference<>(profileManager);
        });
        profileManagerScope.start();
        profileManagerScope.join();
        waitForWeakReferenceGarbageCollection(profileManagerWeakReference);

        assertTrue("ProfileManager was garbage collected",
                profileManagerWeakReference.get() == null);
        assertTrue("Profile manager destructor was called on C++ side",
                HelloWorldStaticLogger.getLog().contains(PROFILE_MANAGER_DESTRUCTOR_LOG));
    }

    /**
     * This method repeats garbage collection and waiting until the passed weak reference is
     * garbage collected and thus get() returns null.
     *
     * @param weakReference the weak reference to the test object
     */
    private void waitForWeakReferenceGarbageCollection(WeakReference<?> weakReference)
            throws InterruptedException {
        int attempts = 0;
        while (weakReference.get() != null && attempts < MAX_GC_ATTEMPTS) {
            System.gc();
            Thread.sleep(100);
            // Creating a new object instance triggers clearing of the reference queue
            ProfileManager profileManager =
                    HelloWorldProfileManagerFactory.createProfileManagerInstance();
            assertNotNull(profileManager);
            attempts++;
        }
    }
}
