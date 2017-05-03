package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import navigation.CppStubSpec;

import java.util.List;

public interface FrancaElement {
    String getName();
    List<String> getPackage();
    ModelInfo getModel();
    Version getVersion();
    CppStubSpec.IDataPropertyAccessor getAccessor();
}
