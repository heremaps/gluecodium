package com.here.ivi.api.loader;

import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;

public interface SpecAccessorFactory<InterfaceAccessor, TypeCollectionAccessor>
{
    String getSpecPath();
    InterfaceAccessor createInterfaceAccessor(FDeployedInterface fdInterface);
    TypeCollectionAccessor createTypeCollectionAccessor(FDeployedTypeCollection fdTypeCollection);
}
