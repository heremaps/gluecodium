package com.here.ivi.api;

import com.google.inject.Injector;
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
import java.net.URI;
import java.util.List;

import com.here.ivi.api.output.ConsoleOutput;
import com.here.ivi.api.output.FileOutput;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.franca.core.dsl.FrancaIDLStandaloneSetup;
import org.franca.deploymodel.dsl.FDeployStandaloneSetup;

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.OptionReaderException;

public class Transpiler {

    public static void main(final String[] args) {
        try {
            new Transpiler("../fidl", new OptionReader(args)).execute();
        } catch (OptionReaderException e) {
            System.out.println(e.getMessage());
            System.exit(1);
        }
    }

    public Transpiler(String path, OptionReader options) {
        this.rootPath = path;
        this.options = options;
    }

    public void execute() {
        generateLegacy(rootPath);
        generateCppStub(rootPath);
    }

    public void generateLegacy(String path) {
        // type specific, to create the right accessors
        final LegacySpecAccessorFactory specAccessorFactory = new LegacySpecAccessorFactory();
        final LegacyGeneratorSuite cgs = new LegacyGeneratorSuite(this);

        generate(specAccessorFactory, cgs, path);
    }

    public void generateCppStub(String path) {
        // type specific, to create the right accessors
        final CppStubSpecAccessorFactory specAccessorFactory = new CppStubSpecAccessorFactory();
        final CppStubGeneratorSuite cgs = new CppStubGeneratorSuite(this);

        generate(specAccessorFactory, cgs, path);
    }

    public <IA, TA> void generate(SpecAccessorFactory<IA, TA> specAccessorFactory,
                                         GeneratorSuite<IA, TA> generatorSuite,
                                         String inputPath) {
        final FrancaModelLoader<IA, TA> fml = new FrancaModelLoader<>(specAccessorFactory);
        fdeplInjector.injectMembers(fml);
        fidlInjector.injectMembers(fml);
        FrancaModel<IA, TA> model = fml.load(specAccessorFactory.getSpecPath(), inputPath);

        // invoke the right generator
        final List<GeneratedFile> files = generatorSuite.generate(model);

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
        File rootFile = new File(rootPath);
        if (rootFile.isFile()) {
            rootFile = rootFile.getParentFile();
        }
        final URI parentURI = URI.create(rootFile.getCanonicalPath());
        final URI childURI = URI.create(other);
        return parentURI.relativize(childURI).toString();
    }

    private final String rootPath;
    private final OptionReader options;

    private final static Injector fdeplInjector = new FDeployStandaloneSetup().createInjectorAndDoEMFRegistration();
    private final static Injector fidlInjector = new FrancaIDLStandaloneSetup().createInjectorAndDoEMFRegistration();
}
