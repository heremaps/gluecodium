package com.here.ivi.api;

import com.google.inject.Injector;
import com.here.ivi.api.generator.legacy.LegacyGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.legacy.LegacyGeneratorSuite;
import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.generator.cppstub.CppStubGeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.cppstub.CppStubSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.loader.legacy.LegacySpecAccessorFactory;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.net.URI;
import java.util.Arrays;
import java.util.List;

import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.franca.core.dsl.FrancaIDLStandaloneSetup;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup;

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.OptionReaderException;

public class Transpiler {

    static List<String> GENERATORS = Arrays.asList("legacy", "stub");

    public static void main(final String[] args) {

        OptionReader or = new OptionReader( );
        try {
            OptionReader.TranspilerOptions options = or.read(args);
            new Transpiler(options).execute();
        } catch (OptionReaderException e) {
            System.err.println("Failed reading options: " + e.getMessage() + "\n");
            or.printUsage();
            System.exit(1);
        }
    }

    public Transpiler(OptionReader.TranspilerOptions options) {
        this.options = options;
    }

    public void execute() {
        List<String> generators = options.getGenerators();

        for ( String sn : generators ) {
            System.out.println("Using generator " + sn);

            try {
                GeneratorSuite<?, ?> generator = GeneratorSuite.instantiateByShortName(sn, this);
                System.out.println("Instantiated generator " + generator.getName() + " " + generator.getVersion());
                List<GeneratedFile> outputFiles = generate(generator, options.getInputDir());
                output(outputFiles);
            } catch (IllegalAccessException | InstantiationException | NoSuchMethodException | InvocationTargetException e) {
                System.err.println("Failed instantiation of generator '" + sn + "'");
            }

            System.out.println("");
        }
    }

    public <IA, TA> List<GeneratedFile> generate(GeneratorSuite<IA, TA> generatorSuite, String inputPath) {
        // build accessor factory
        final SpecAccessorFactory<IA, TA> specAccessorFactory = generatorSuite.createModelAccessorFactory();

        // load model
        final FrancaModelLoader<IA, TA> fml = new FrancaModelLoader<>(specAccessorFactory);
        fdeplInjector.injectMembers(fml);
        fidlInjector.injectMembers(fml);

        FrancaModel<IA, TA> model = fml.load(specAccessorFactory.getSpecPath(), inputPath);

        // invoke the generator
        // sadly this has to use a specific generic, otherwise the whole chain of generics would be sane
        return generatorSuite.generate(model);
    }

    public void output(List<GeneratedFile> files) {
        // handle output options
        if (options.dumpToStdout()) {
            try {
                ConsoleOutput co = new ConsoleOutput();
                co.output(files);
            } catch (IOException e) {
            }
        }

        String outdir = options.getOutputDir();
        if (outdir != null) {
            try {
                FileOutput fo = new FileOutput(new File(outdir));
                fo.output(files);
            } catch (IOException e) {
            }
        }
    }

    public Version getVersion() {
        return new Version(0,0,1);
    }
    public String getName() {
        return "com.here.Transpiler";
    }

    public String resolveRelativeToRootPath(String other) throws IOException {
        File rootFile = new File(options.getInputDir());
        if (rootFile.isFile()) {
            rootFile = rootFile.getParentFile();
        }
        final URI parentURI = URI.create(rootFile.getCanonicalPath());
        final URI childURI = URI.create(other);
        return parentURI.relativize(childURI).toString();
    }

    private final OptionReader.TranspilerOptions options;

    private final static Injector fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration();
    private final static Injector fidlInjector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration();
}
