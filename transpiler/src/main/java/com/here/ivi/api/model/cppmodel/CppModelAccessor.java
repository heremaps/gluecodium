package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import navigation.CppStubSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import java.util.Optional;

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

    public CppModelAccessor(FTypeCollection type, FModel model, DPA accessor, IModelNameRules rules,
           FrancaModel<? extends CppStubSpec.IDataPropertyAccessor,? extends CppStubSpec.IDataPropertyAccessor> fModel){

        super(type, model);
        this.accessor = accessor;
        this.rules = rules;
        this.model = fModel;
    }


    public DPA getAccessor() {
        return accessor;
    }

    /**
     * Searches an accessor object for given type-collection and model.
     * @param definer the definer containing type-collection and model
     * @return The franca accessor for the given model and type-collection
     */
    public Optional<CppStubSpec.IDataPropertyAccessor> getAccessor(DefinedBy definer){

        FTypeCollection tc = definer.type;
        FModel model = definer.model;

        Optional<? extends FrancaModel.FrancaElement> result =
           tc instanceof FInterface ?
           ((FrancaModel<CppStubSpec.IDataPropertyAccessor,CppStubSpec.IDataPropertyAccessor>)this.model).findInterface(model,(FInterface) tc) :
           ((FrancaModel<CppStubSpec.IDataPropertyAccessor,CppStubSpec.IDataPropertyAccessor>)this.model).findTypeCollection(model,tc);

        if(result.isPresent()) {
            return Optional.of(
                    tc instanceof FInterface ?
                            ((FrancaModel.Interface<CppStubSpec.IDataPropertyAccessor>) result.get()).accessor :
                            ((FrancaModel.TypeCollection<CppStubSpec.IDataPropertyAccessor>) result.get()).accessor
            );
        }
        return Optional.empty();
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
    private final FrancaModel<? extends CppStubSpec.IDataPropertyAccessor,? extends CppStubSpec.IDataPropertyAccessor> model;
}
