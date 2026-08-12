/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>Test case 2
 * <p>Input:
 * <ul>
 * <li>This structure does not define explicit constructors / field constructors.</li>
 * <li>It has one public field with default value.</li>
 * <li>One of fields is internal.</li>
 * </ul>
 * <p>Expected outcome:
 * <ul>
 * <li>Generated initialized args constructor is not public (because it would expose internal field).</li>
 * </ul>
 */
public final class NoCtorsInitializedPublicFieldOneInternalField {
    @NonNull
    String internalField;
    public boolean publicField;
    public int initializedField;

    NoCtorsInitializedPublicFieldOneInternalField(@NonNull final String internalField, final boolean publicField) {
        this.internalField = internalField;
        this.publicField = publicField;
        this.initializedField = 77;
    }


}

