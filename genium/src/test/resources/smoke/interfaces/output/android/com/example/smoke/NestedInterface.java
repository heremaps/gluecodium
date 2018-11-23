/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public interface NestedInterface {
    void setSameTypeInstances(final SimpleInterface interfaceOne, final SimpleInterface interfaceTwo);
    SimpleInterface getInstanceOne();
    SimpleInterface getInstanceTwo();
    VeryExternalInterface makeMoreExternal(final ExternalInterface input);
    @NonNull
    VeryExternalInterface.SomeStruct makeMoreExternal(@NonNull final ExternalInterface.SomeStruct input);
    VeryExternalInterface.SomeEnum makeMoreExternal(final ExternalInterface.SomeEnum input);
}
