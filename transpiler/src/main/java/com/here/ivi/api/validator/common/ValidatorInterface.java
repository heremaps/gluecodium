package com.here.ivi.api.validator.common;

import com.here.ivi.api.model.FrancaModel;
import navigation.CppStubSpec;

public interface ValidatorInterface<IA extends CppStubSpec.InterfacePropertyAccessor,
                                    TA extends CppStubSpec.TypeCollectionPropertyAccessor> {

    boolean validate(FrancaModel<IA, TA> model);
}
