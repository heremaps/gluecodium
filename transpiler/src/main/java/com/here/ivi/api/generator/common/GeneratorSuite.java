package com.here.ivi.api.generator.common;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.model.FrancaModel;

import java.util.List;

public interface GeneratorSuite<IA, TA> {

    Transpiler getTool();

    Version getVersion();

    String getName();

    List<GeneratedFile> generate(FrancaModel<IA, TA> model);
}
