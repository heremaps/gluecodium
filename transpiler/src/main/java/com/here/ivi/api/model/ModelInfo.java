package com.here.ivi.api.model;

import org.franca.core.franca.FModel;

// Information about the models
public class ModelInfo {
    public ModelInfo(FModel fModel) {
        this.fModel = fModel;
    }

    final private FModel fModel;

    public String getName() {
        return fModel.getName();
    }
    public String getPath() {
        return fModel.eResource().getURI().path();
    }

    public FModel getFrancaModel() {
        return fModel;
    }
}
