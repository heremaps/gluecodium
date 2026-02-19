/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

interface InternalInterface {

    void fooBar();

    @NonNull
    static String getSomeInternalProperty() {
        return InternalInterfaceImpl.getSomeInternalProperty();
    }


    static void setSomeInternalProperty(@NonNull final String value) {
        InternalInterfaceImpl.setSomeInternalProperty(value);
    }

}

