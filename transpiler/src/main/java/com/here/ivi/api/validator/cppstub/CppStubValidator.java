package com.here.ivi.api.validator.cppstub;

import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.validator.common.ValidatorInterface;
import navigation.CppStubSpec;

public class CppStubValidator implements ValidatorInterface<CppStubSpec.InterfacePropertyAccessor,
        CppStubSpec.TypeCollectionPropertyAccessor>  {

    @Override
    public boolean validate(
            FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model) {
        //TODO put here cppstub specific validation.
        return true;
    }
}
