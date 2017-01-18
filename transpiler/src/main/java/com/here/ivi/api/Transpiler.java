package com.here.ivi.api;

import com.google.inject.Injector;
import com.here.ivi.api.generator.GeneratedFile;
import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
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

    public static void execute(final String[] args) {
        System.out.println("...starting up...");

        final Injector fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration();
        final Injector fidlInjector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration();

        // type specific, to create the right accessors
        final FrancaModelLoader<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor> fml =
                new FrancaModelLoader<>(new LegacySpecAccessorFactory());

        fdeplInjector.injectMembers(fml);
        fidlInjector.injectMembers(fml);

        Transpiler.generate(fml.load("../fidl/"));
    }

    public static void generate(FrancaModel<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor> model) {

        // type specific to invoke the right generator
        LegacyGeneratorSuite cgs = new LegacyGeneratorSuite();

        List<GeneratedFile> files = cgs.generate(model);

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
