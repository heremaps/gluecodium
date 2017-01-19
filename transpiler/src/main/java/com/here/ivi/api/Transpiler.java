package com.here.ivi.api;

import com.google.inject.Injector;
import com.here.ivi.api.generator.GeneratedFile;
import com.here.ivi.api.generator.GeneratorSuite;
import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.loader.legacy.LegacySpecAccessorFactory;
import com.here.navigation.LegacySpec;

import java.util.List;

import org.eclipse.xtend2.lib.StringConcatenation;
import org.franca.core.dsl.FrancaIDLStandaloneSetup;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup;

public class Transpiler {
    public static void main(final String[] args) {
        Transpiler.execute(args);
    }

    private final static Injector fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration();
    private final static Injector fidlInjector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration();

    public static void execute(final String[] args) {
        System.out.println("...starting up...");

        String path = "../fidl/";

        generateLegacy(path);
    }

    public static void generateLegacy(String path) {
        // type specific, to create the right accessors
        final LegacySpecAccessorFactory specAccessorFactory = new LegacySpecAccessorFactory();
        final LegacyGeneratorSuite cgs = new LegacyGeneratorSuite();

        generate(specAccessorFactory, cgs, path);
    }

    public static <IA, TA> void generate(SpecAccessorFactory<IA, TA> specAccessorFactory,
                                         GeneratorSuite<IA, TA> generatorSuite,
                                         String path) {
        final FrancaModelLoader<IA, TA> fml = new FrancaModelLoader<>(specAccessorFactory);
        fdeplInjector.injectMembers(fml);
        fidlInjector.injectMembers(fml);
        FrancaModel<IA, TA> model = fml.load(specAccessorFactory.getSpecPath(), path);

        // invoke the right generator
        final List<GeneratedFile> files = generatorSuite.generate(model);
        printFiles(files);
    }

    private static void printFiles(List<GeneratedFile> files) {
        files.forEach(file -> {
            StringConcatenation builder = new StringConcatenation();
            builder.append("Generated ");
            builder.append(file.targetFile.getPath(), "");
            builder.append(":");
            builder.newLineIfNotEmpty();
            builder.newLine();
            builder.append("        ");
            builder.append(file.content, "        ");
            builder.newLineIfNotEmpty();

            System.out.println(builder.toString());
        });

        System.out.println("Done.");
    }
}
