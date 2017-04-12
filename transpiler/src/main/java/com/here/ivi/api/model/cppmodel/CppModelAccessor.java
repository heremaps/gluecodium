package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.generator.common.templates.CppNameRules;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaModel;
import navigation.CppStubSpec;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

import java.util.List;
import java.util.Optional;

public class CppModelAccessor<DPA extends CppStubSpec.IDataPropertyAccessor> extends DefinedBy {

    public CppModelAccessor(FTypeCollection type, FModel model, DPA accessor, CppNameRules rules,
           FrancaModel<? extends CppStubSpec.IDataPropertyAccessor,
                       ? extends CppStubSpec.IDataPropertyAccessor> fModel){

        super(type, model);
        this.accessor = accessor;
        this.rules = rules;
        this.francaModel = fModel;
    }

    public DPA getAccessor() {
        return accessor;
    }

    /**
     * Searches for an accessor object by the given type-collection and francaModel.
     *
     * @implNote Will search through all the loaded franca models.
     *
     * @param definer the definer containing type-collection and francaModel
     * @return The franca accessor for the given francaModel and type-collection
     */
    public Optional<CppStubSpec.IDataPropertyAccessor> getAccessor(DefinedBy definer){
        return francaModel.find(definer).map(FrancaModel.FrancaElement::getAccessor);
    }

    /**
     * @return the name rules
     */
    public CppNameRules getRules() {
        return rules;
    }

    public List<String> getNamespace() {
        return rules.packageToNamespace(getPackages());
    }

    private final DPA accessor;
    private final CppNameRules rules;
    private final FrancaModel<? extends CppStubSpec.IDataPropertyAccessor,
                              ? extends CppStubSpec.IDataPropertyAccessor> francaModel;

}
