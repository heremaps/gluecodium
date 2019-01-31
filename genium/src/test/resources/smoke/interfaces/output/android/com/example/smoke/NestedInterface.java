/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface NestedInterface {
    void setSameTypeInstances(@NonNull final SimpleInterface interfaceOne, @NonNull final SimpleInterface interfaceTwo);
    @NonNull
    SimpleInterface getInstanceOne();
    @NonNull
    SimpleInterface getInstanceTwo();
    @NonNull
    VeryExternalInterface makeMoreExternal(@NonNull final ExternalInterface input);
    @NonNull
    VeryExternalInterface.SomeStruct makeMoreExternal(@NonNull final ExternalInterface.SomeStruct input);
    @NonNull
    VeryExternalInterface.SomeEnum makeMoreExternal(@NonNull final ExternalInterface.SomeEnum input);
}
