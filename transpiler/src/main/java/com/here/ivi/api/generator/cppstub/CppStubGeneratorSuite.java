package com.here.ivi.api.generator.cppstub;

import com.here.ivi.api.Transpiler;
import com.here.ivi.api.generator.common.*;

import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.loader.cppstub.CppStubSpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.ModelHelper;
import com.here.ivi.api.model.StructMethodHelper;
import com.here.ivi.api.validator.common.BasicValidator;
import com.here.ivi.api.validator.cppstub.CppStubValidator;
import navigation.CppStubSpec;
import org.apache.commons.io.IOUtils;
import org.eclipse.emf.ecore.resource.ResourceSet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.*;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import java.util.stream.Stream;


/**
 * This generator will build all the CppStubs that will have to be implemented on the client side @ref StubGenerator
 * as well as the data used by this stubs @ref TypeCollectionGenerator.
 *
 * It is the underlying generator, that all others depend on, as they will invoke the actual implementation through
 * the Stub interfaces.
 *
 */
public class CppStubGeneratorSuite
        extends Generator<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> {
    private final SpecAccessorFactory<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor>
            specAccessorFactory;
    private final CppStubValidator validator = new CppStubValidator();
    private FrancaModel<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> model;
    private FrancaModelLoader<CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> fml;
    private Collection<File> currentFiles;

    static Logger logger = java.util.logging.Logger.getLogger(CppStubGeneratorSuite.class.getName());

    public CppStubGeneratorSuite(Transpiler tp) {
        super(tp);
        specAccessorFactory = new CppStubSpecAccessorFactory();
    }

    @Override
    public List<GeneratedFile> generateFiles() {
        // TODO add model null check

        CppStubNameRules nameRules = new CppStubNameRules(model);

        CppStubStructGenerator structGenerator = new CppStubStructGenerator(nameRules);

        // partition model into ifaces, typecollections and structWithMethods and generate files from that
        Stream<GeneratedFile> generatorStreams = StructMethodHelper.partitionModel(
                model,
                iface -> {
                    StubGenerator generator = new StubGenerator(this, model, nameRules, iface);
                    return generator.generate();
                },
                tc -> {
                    TypeCollectionGenerator generator = new TypeCollectionGenerator(this, model, nameRules, tc);
                    return generator.generate();
                },
                smp -> structGenerator.generateFiles(this, model, smp.iface, smp.type)
        );

        List<GeneratedFile> list = generatorStreams.filter(Objects::nonNull).collect(Collectors.toList());
        list.add(copyTarget("here/internal/AsyncAPI.h", "src/"));
        list.add(copyTarget("here/internal/AsyncAPI.cpp", "src/"));
        list.add(copyTarget("here/internal/expected.h", "src/"));
        list.add(copyTarget("here/internal/ListenerVector.h", "src/"));

        return list;
    }

    private static GeneratedFile copyTarget(String fileName, String target) {
        InputStream stream = CppStubGeneratorSuite.class.getClassLoader().getResourceAsStream(fileName);

        if (stream != null) {
            try {
                String content = IOUtils.toString(stream, Charset.defaultCharset());
                return new GeneratedFile(content, target + File.separator + fileName);
            } catch (IOException ignored) {
            }
        }

        logger.severe("Failed loading resource " + fileName);

        return null;
    }

    @Override
    public Version getVersion() {
        return new Version(0, 0, 1);
    }

    @Override
    public String getName() {
        return "com.here.CppStubGenerator";
    }

    @Override
    public String getSpecPath() {
        return specAccessorFactory.getSpecPath();
    }

    @Override
    public void buildModel(String inputPath) {
        // load model
        fml = new FrancaModelLoader<>(specAccessorFactory);

        ModelHelper.getFdeplInjector().injectMembers(fml);
        currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath));

        model = fml.load(specAccessorFactory.getSpecPath(), currentFiles);
    }

    @Override
    public boolean validate() {
        ResourceSet rs = fml.getResourceSetProvider().get();
        return BasicValidator.validate(rs, currentFiles) && validator.validate(model);
    }

    @Override
    protected List<IFileTool> registerTools() {
        try {
            List<IFileTool> tools = new LinkedList<>();

            tools.add(new ConditionalExecutor(
                    ConditionalExecutor.FileExtensionFilter(Arrays.asList("cpp", "h")),
                    new ClangFormatter("cpp_style/.clang-format", ClangFormatter.Language.CPP)));

            return tools;
        } catch (IOException e) {
            logger.severe(String.format("Registering tools failed with error: %s", e));
            return new LinkedList<>();
        }
    }
}

