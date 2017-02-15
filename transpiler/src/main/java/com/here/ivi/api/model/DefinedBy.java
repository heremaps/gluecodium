package com.here.ivi.api.model;

import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class DefinedBy {
    public final FTypeCollection type; // FInterface is FTypeCollection as well
    public final FModel model;

    public DefinedBy(FTypeCollection type, FModel model) {
        this.type = type;
        this.model = model;
    }

    @Override
    public String toString() {
        return model.getName() + "." + type.getName();
    }
}
