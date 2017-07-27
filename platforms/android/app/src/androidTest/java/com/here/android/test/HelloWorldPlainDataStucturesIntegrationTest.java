package com.here.android.test;

import android.support.annotation.NonNull;
import android.support.test.filters.SmallTest;
import android.support.test.runner.AndroidJUnit4;

import com.here.android.hello.HelloWorldPlainDataStructures;

import org.junit.Test;
import org.junit.runner.RunWith;

import static org.junit.Assert.assertEquals;

@RunWith(AndroidJUnit4.class)
@SmallTest
public class HelloWorldPlainDataStucturesIntegrationTest {
    @Test
    public void nonNestedPlainDataStruture() {
        HelloWorldPlainDataStructures.SyncResult input = createSyncResult();

        HelloWorldPlainDataStructures.SyncResult result =
                HelloWorldPlainDataStructures.methodWithNonNestedType(input);

        assertEquals(input.lastUpdatedTimeStamp, result.lastUpdatedTimeStamp);
        assertEquals(input.numberOfChanges + 1, result.numberOfChanges);
    }

    @Test
    public void nestedPlainDataStruture() {
        HelloWorldPlainDataStructures.IdentifiableSyncResult input =
                new HelloWorldPlainDataStructures.IdentifiableSyncResult();
        input.syncResult = createSyncResult();
        input.id = 20;

        HelloWorldPlainDataStructures.IdentifiableSyncResult result =
                HelloWorldPlainDataStructures.methodWithNestedType(input);

        assertEquals(input.syncResult.lastUpdatedTimeStamp, result.syncResult.lastUpdatedTimeStamp);
        assertEquals(input.syncResult.numberOfChanges + 1, result.syncResult.numberOfChanges);
        assertEquals(input.id, result.id);
    }

    @NonNull
    private HelloWorldPlainDataStructures.SyncResult createSyncResult() {
        HelloWorldPlainDataStructures.SyncResult input =
                new HelloWorldPlainDataStructures.SyncResult();
        input.lastUpdatedTimeStamp = 100l;
        input.numberOfChanges = 5;
        return input;
    }
}
