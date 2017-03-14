package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import navigation.CppStubSpec;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class CppModelAccessor<DPA extends CppStubSpec.IDataPropertyAccessor> extends DefinedBy {

    /**
     * This interface is used to apply the naming rules to get the correct names for generated types and namespaces
     *
     * It is used within the CppTypeMapper to ensure the type naming is aligned throughout a generator.
     */
    public interface IModelNameRules {

        /**
         * @param baseName The base fidl name of the interface, e.g. Route
         * @return The actual name as generated for this model, e.g. RouteStub
         */
        String getInterfaceName(String baseName);

        /**
         * @param packages The package name as defined in the fidl, e.g. [navigation, guidance]
         * @return The actual namespace for this package as generated for this model, e.g. [legacy]
         */
        String[] getNamespace(String[] packages);
    }

    public CppModelAccessor(FTypeCollection type, FModel model, DPA accessor, IModelNameRules rules) {
        super(type, model);
        this.accessor = accessor;
        this.rules = rules;
    }

    public DPA getAccessor() {
        return accessor;
    }

    /** gets the name of the interface as defined by the IModelNameRules */
    public String getModelInterfaceName(String baseName) {
        return rules.getInterfaceName(baseName);
    }

    /** gets the namespace of the interface as defined by the IModelNameRules */
    public String[] getModelNamespace() {
        return rules.getNamespace(getPackages());
    }

    /** gets the namespace as defined by the IModelNameRules */
    public String[] getModelNamespace(String[] packages) {
        return rules.getNamespace(packages);
    }

    private final DPA accessor;
    private final IModelNameRules rules;
}
