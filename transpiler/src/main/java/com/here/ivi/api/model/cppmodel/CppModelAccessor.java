package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import navigation.CppStubSpec;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class CppModelAccessor<DPA extends CppStubSpec.IDataPropertyAccessor> extends DefinedBy {

    public CppModelAccessor(FTypeCollection type, FModel model, DPA accessor) {
        super(type, model);
        this.accessor = accessor;
    }

    public final DPA accessor;
}
