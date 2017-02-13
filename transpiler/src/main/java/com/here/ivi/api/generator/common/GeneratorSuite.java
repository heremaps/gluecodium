package com.here.ivi.api.generator.common;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.model.FrancaModel;

import java.util.List;

/**
 * The base for all the generators.
 *
 * @param <IA> the InterfaceAccessor, such as @ref com.here.navigation.LegacySpec.InterfacePropertyAccesor
 * @param <TA> the TypeCollectionAccesor, such as @ref com.here.navigation.LegacySpec.TypeCollectionPropertyAccesor
 */
public interface GeneratorSuite<IA, TA> {

    /**
     * @return the tool this generator belongs to
     */
    Transpiler getTool();

    /**
     * @return the version of this generator
     */
    Version getVersion();

    /**
     * @return the human readable name of this generator
     */
    String getName();

    /**
     * Generates the files of this generator
     *
     * @param model The model of all the parsed franca and fdepl files
     * @return a list of generated files with their relative target paths
     */
    List<GeneratedFile> generate(FrancaModel<IA, TA> model);
}
