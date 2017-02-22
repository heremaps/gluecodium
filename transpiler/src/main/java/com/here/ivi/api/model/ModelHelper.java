package com.here.ivi.api.model;


import com.google.inject.Injector;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup;

public class ModelHelper {
    private final static Injector fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration();
    public static Injector getFdeplInjector(){
        return fdeplInjector;
    }
}
