package com.here.ivi.api.validator.common;

import com.here.ivi.api.model.FrancaModel;

public interface ValidatorInterface<IA, TA> {

    boolean validate(FrancaModel<IA, TA> model);

}