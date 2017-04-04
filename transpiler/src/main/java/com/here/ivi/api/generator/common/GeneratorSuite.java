package com.here.ivi.api.generator.common;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.generator.cppstub.CppStubGeneratorSuite;
import com.here.ivi.api.loader.SpecAccessorFactory;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.List;

/**
 * The base for all the generators.
 *
 * @param <IA> the InterfaceAccessor, such as @ref navigation.LegacySpec.InterfacePropertyAccesor
 * @param <TA> the TypeCollectionAccesor, such as @ref navigation.LegacySpec.TypeCollectionPropertyAccesor
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
    List<GeneratedFile> generate();

    /**
     * Creates the spec accessor factory required for this generator, that will then
     * create the SpecAccessors.
     *
     * @return the accessor that will be used to load the fdepl files
     */
    SpecAccessorFactory<IA, TA> createModelAccessorFactory();

    /**
     * Uses the internal validator to validate the model.
     *
     * @return boolean True if the model is valid, false otherwise.
     */
    boolean validate();

    /**
     * Uses the FrancaModelLoader to keep a copy of the model.
     * @param inputPath The root directory of the fidl/fdepl files.
     */
    void buildModel(String inputPath);

    /**
     * Generates a specific GeneratorSuite instance as specified by the first class parameter.
     * You have to pass in an actual class type, as during runtime it is not known.
     */
    static <SIA, STA> GeneratorSuite<SIA, STA> instantiate(Class< ? extends GeneratorSuite<SIA, STA>> generator, Transpiler tool)
            throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Constructor<? extends GeneratorSuite<SIA, STA>> constructor = generator.getConstructor(Transpiler.class);
        return constructor.newInstance(tool);
    }

    /**
     * Creates a new instance of a generator by its short identifier
     */
    static GeneratorSuite<?, ?> instantiateByShortName(String shortName, Transpiler tool)
            throws InvocationTargetException, NoSuchMethodException, InstantiationException, IllegalAccessException {
        switch (shortName) {
            case "legacy":
                return instantiate(LegacyGeneratorSuite.class, tool);
            case "stub":
                return instantiate(CppStubGeneratorSuite.class, tool);
        }

        throw new InstantiationException();
    }

    /**
     * @return all available generators
     */
    static List<String> generatorShortNames() {
        return Arrays.asList("legacy", "stub");
    }
}
