/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

public final class PublicStructWithInternalConstructors {
    public int someVar;


    PublicStructWithInternalConstructors() {
        PublicStructWithInternalConstructors _other = make();
        this.someVar = _other.someVar;
    }

    PublicStructWithInternalConstructors(final int someVar) {
        this.someVar = someVar;
    }

    private static native PublicStructWithInternalConstructors make();


}

