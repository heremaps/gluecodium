package com.here.ivi.api.loader.cppstub;

import com.here.ivi.api.loader.SpecAccessorFactory;
import navigation.CppStubSpec;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;

public class CppStubSpecAccessorFactory
        implements SpecAccessorFactory<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
{
    @Override
    public String getSpecPath() {
        return "classpath:/navigation/CppStubSpec.fdepl";
    }

    @Override
    public CppStubSpec.InterfacePropertyAccessor createInterfaceAccessor(FDeployedInterface fdInterface) {
        return new CppStubSpec.InterfacePropertyAccessor(fdInterface);
    }

    @Override
    public CppStubSpec.TypeCollectionPropertyAccessor createTypeCollectionAccessor(
            FDeployedTypeCollection fdTypeCollection) {
        return new CppStubSpec.TypeCollectionPropertyAccessor(fdTypeCollection);
    }
}

