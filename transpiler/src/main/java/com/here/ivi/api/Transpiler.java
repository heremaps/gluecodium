package com.here.ivi.api;

import com.google.inject.Injector;
import com.here.ivi.api.generator.legacy.LegacyGenerator;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.loader.LegacySpecAccessorFactory;
import com.here.navigation.LegacySpec;

import java.util.List;
import java.util.Map;
import java.util.function.BiConsumer;

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
        final FrancaModelLoader<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor> fml =
                new FrancaModelLoader<>(new LegacySpecAccessorFactory());

        fdeplInjector.injectMembers(fml);
        fidlInjector.injectMembers(fml);

        List<FrancaModel<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor>> models;
        models = fml.load("../fidl/");
        Transpiler.generate(models);
    }

    public static void generate(final List<FrancaModel<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor>> models) {
        for (final FrancaModel<LegacySpec.InterfacePropertyAccessor, LegacySpec.TypeCollectionPropertyAccessor> model : models) {
            for (final FrancaModel.Interface<LegacySpec.InterfacePropertyAccessor> iface : model.interfaces) {
                {
                    System.out.println("Found interface:  " + iface.fInterface.getName());

                    Map<String, CharSequence> files = LegacyGenerator.generateFiles(iface);
                    final BiConsumer<String, CharSequence> _function = (String file_name, CharSequence content) -> {
                        StringConcatenation _builder = new StringConcatenation();
                        _builder.append("Generated ");
                        _builder.append(file_name, "");
                        _builder.append(":");
                        _builder.newLineIfNotEmpty();
                        _builder.newLine();
                        _builder.append("        ");
                        _builder.append(content, "        ");
                        _builder.newLineIfNotEmpty();
                        System.out.println(_builder.toString());
                    };
                    files.forEach(_function);
                }
            }
        }

        System.out.println("Done.");
    }
}
