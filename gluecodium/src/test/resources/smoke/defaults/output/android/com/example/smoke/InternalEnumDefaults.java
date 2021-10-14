/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
public final class InternalEnumDefaults {
    @NonNull
    public FooBarEnum publicField;
    @NonNull
    public List<FooBarEnum> publicListField;
    @NonNull
    FooBarEnum internalField;
    @NonNull
    List<FooBarEnum> internalListField;
    public InternalEnumDefaults() {
        this.publicField = FooBarEnum.FOO;
        this.publicListField = new ArrayList<>(Arrays.asList(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ));
        this.internalField = FooBarEnum.BAR;
        this.internalListField = new ArrayList<>(Arrays.asList(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ));
    }
    public InternalEnumDefaults(@NonNull final FooBarEnum publicField, @NonNull final List<FooBarEnum> publicListField) {
        this.publicField = publicField;
        this.publicListField = publicListField;
        this.internalField = FooBarEnum.BAR;
        this.internalListField = new ArrayList<>(Arrays.asList(FooBarEnum.FOO, FooBarEnum.BAR, FooBarEnum.BAZ));
    }
    InternalEnumDefaults(@NonNull final FooBarEnum publicField, @NonNull final List<FooBarEnum> publicListField, @NonNull final FooBarEnum internalField, @NonNull final List<FooBarEnum> internalListField) {
        this.publicField = publicField;
        this.publicListField = publicListField;
        this.internalField = internalField;
        this.internalListField = internalListField;
    }
}
