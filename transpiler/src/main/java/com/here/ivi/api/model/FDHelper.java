package com.here.ivi.api.model;

import com.google.inject.Inject;
import com.here.ivi.api.loader.FrancaModelLoader;
import org.apache.commons.io.FilenameUtils;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.FDeployPersistenceManager;
import org.franca.deploymodel.dsl.fDeploy.*;
import java.util.*;
import java.io.*;
import java.util.Collection;
import java.util.Set;
import java.util.logging.Logger;
import java.util.stream.Collectors;


public class FDHelper {
    private static Logger logger = Logger.getLogger(FrancaModelLoader.class.getName());

    static private class FDeplLoader {
        @Inject
        public FDeployPersistenceManager m_fdeplLoader;
    }

    private static FDModel loadModel(URI uri, FDeployPersistenceManager manager) {
        return  manager.loadModel(uri, FrancaModelLoader.ROOT_URI);
    }

    public static FDModel loadModel(String uri) {
        FDeplLoader loader = new FDeplLoader();
        ModelHelper.getFdeplInjector().injectMembers(loader);
        return loadModel(URI.createURI(uri), loader.m_fdeplLoader);
    }

    private static List<FDModel> loadModels(Collection<File> fdeplFiles) {
        FDeplLoader loader = new FDeplLoader();
        ModelHelper.getFdeplInjector().injectMembers(loader);
        return fdeplFiles.stream().map(f -> {
            URI asUri = URI.createFileURI(f.getAbsolutePath());
            return loadModel(asUri, loader.m_fdeplLoader);
        }).collect(Collectors.toList());
    }

    private static List<FDSpecification> findSpecifications(Collection<FDModel> models) {
        List<FDSpecification> specs = new ArrayList<>();
        for ( FDModel model : models) {
            specs.addAll(model.getDeployments().stream().map(FDRootElement::getSpec).collect(Collectors.toList()));
        }
        return specs;
    }

    public static Set<String> findSpecificationNames(String inputDir) {
        Collection<File> fdeplFiles = FrancaModelLoader.listFilesRecursively(new File(inputDir))
                .stream()
                .filter(f -> FilenameUtils.getExtension(f.getAbsoluteFile().getName()).equals(FrancaModelLoader.FDEPL_SUFFIX))
                .collect(Collectors.toList());
        logger.info(String.format("Discovery based on %1$d fdepl file(s)", fdeplFiles.size()));
        Collection<FDModel> models = FDHelper.loadModels(fdeplFiles);
        Collection<FDSpecification> specs = FDHelper.findSpecifications(models);
        Set<String> specNames = new HashSet<>();
        for (FDSpecification spec : specs) {
            FDSpecification derived = null;

            // iterate up over specification inheritance tree
            // note: franca allows only single base
            while (spec != null) {
                if (specNames.add(spec.getName())) {
                    if (derived != null) {
                        logger.info(String.format("Found usage of spec %1$s which is a base for %2$s", spec.getName(), derived.getName()));
                    } else {
                        logger.info("Found usage of spec " + spec.getName());
                    }
                }
                derived = spec;
                spec = spec.getBase();
            }
        }
        return specNames;
    }

    static MappingGenericPropertyAccessor createDummyFDElement(FDSpecification spec, EObject obj) {
        if (obj instanceof FInterface) {
            FDInterface el = FDeployFactory.eINSTANCE.createFDInterface();
            el.setSpec(spec);
            el.setTarget((FInterface) obj);
            return new FDeployedInterface(el);
        } else if (obj instanceof FTypeCollection) {
            FDTypes el = FDeployFactory.eINSTANCE.createFDTypes();
            el.setSpec(spec);
            el.setTarget((FTypeCollection) obj);
            return new FDeployedTypeCollection(el);
        }

        throw new RuntimeException("Unknown type");
    }
}
