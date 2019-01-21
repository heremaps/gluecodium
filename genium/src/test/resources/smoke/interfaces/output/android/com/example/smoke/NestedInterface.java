/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
public interface NestedInterface {
    void setSameTypeInstances(@Nullable final SimpleInterface interfaceOne, @Nullable final SimpleInterface interfaceTwo);
    @Nullable
    SimpleInterface getInstanceOne();
    @Nullable
    SimpleInterface getInstanceTwo();
    @Nullable
    VeryExternalInterface makeMoreExternal(@Nullable final ExternalInterface input);
    @NonNull
    VeryExternalInterface.SomeStruct makeMoreExternal(@NonNull final ExternalInterface.SomeStruct input);
    @NonNull
    VeryExternalInterface.SomeEnum makeMoreExternal(@NonNull final ExternalInterface.SomeEnum input);
}
