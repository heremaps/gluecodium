package com.here.ivi.api.generator;

import com.here.ivi.api.model.FrancaModel;
import com.here.navigation.LegacySpec;

import java.util.List;

public interface GeneratorSuite<IA, TA> {
    List<GeneratedFile> generate(FrancaModel<IA, TA> model);
}
