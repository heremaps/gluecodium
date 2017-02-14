package com.here.ivi.api.loader;

import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;

/**
 * The SpecAccessorFactory helps creating the InterfaceAccessor and TypeCollectionAccessor for a specific
 * Spec. These will later be used to read the additional data given in the fdepl files.
 *
 * This interface and its implementations are needed as there is no way to to a generic instantiate for generic types.
 *
 * @param <InterfaceAccessor>
 * @param <TypeCollectionAccessor>
 */
public interface SpecAccessorFactory<InterfaceAccessor, TypeCollectionAccessor>
{
    /**
     * Returns the full path to the Spec.fdepl file. This path is used to load the spec and create
     * default spec accessors that return the default values as defined in the Spec.
     *
     * @return The path, e.g. "classpath:/com/here/navigation/LegacySpec.fdepl"
     */
    String getSpecPath();

    /**
     * Creates a new InterfaceAccessor
     * @param fdInterface The deployed interface to use for internal data access
     * @return the InterfaceAccessor, to grant access to the Spec properties as defined in the fdInterface
     */
    InterfaceAccessor createInterfaceAccessor(FDeployedInterface fdInterface);

    /**
     * Creates a new TypeCollectionAccessor
     * @param fdTypeCollection The deployed interface to use for internal data access
     * @return the TypeCollectionAccessor, to grant access to the Spec properties as defined in the fdTypeCollection
     */
    TypeCollectionAccessor createTypeCollectionAccessor(FDeployedTypeCollection fdTypeCollection);
}
