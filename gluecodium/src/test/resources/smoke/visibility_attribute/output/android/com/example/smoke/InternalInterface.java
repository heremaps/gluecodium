/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

interface InternalInterface {

    void fooBar();

    @NonNull
    static String getSomePropertyOfInternalInterface() {
        return InternalInterfaceImpl.getSomePropertyOfInternalInterface();
    }


    static void setSomePropertyOfInternalInterface(@NonNull final String value) {
        InternalInterfaceImpl.setSomePropertyOfInternalInterface(value);
    }

}

