package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import navigation.CppStubSpec;
import org.franca.core.franca.FTypeCollection;

import java.util.List;

public interface FrancaElement<DPA extends CppStubSpec.IDataPropertyAccessor> {
    String getName();
    List<String> getPackage();
    ModelInfo getModel();
    FTypeCollection getFrancaTypeCollection();
    Version getVersion();
    DPA getPropertyAccessor();
}
