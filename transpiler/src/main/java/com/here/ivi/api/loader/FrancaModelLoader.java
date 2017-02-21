package com.here.ivi.api.loader;

import com.google.inject.Inject;
import com.here.ivi.api.loader.SpecAccessorFactory;
import com.here.ivi.api.model.FrancaModel;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.filefilter.DirectoryFileFilter;
import org.apache.commons.io.filefilter.OrFileFilter;
import org.apache.commons.io.filefilter.SuffixFileFilter;
import org.eclipse.emf.common.util.URI;
import org.franca.core.dsl.FrancaPersistenceManager;
import org.franca.deploymodel.dsl.FDeployPersistenceManager;
import org.franca.deploymodel.dsl.fDeploy.*;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * The FrancaModelLoader scans a directory recursively for fdepl and fidl files and collects all the data from them.
 *
 * 1. It scans the directory for all .fdepl and .fidl files.
 * 2. It then loads & parses each fdepl file using the FDeployPersistenceManager.
 * 3. It collects all the interfaces/types/etc combined with their special InterfaceAccessor if data is defined.
 * 4. Lastly it loads & parses all fidl files that were not imported by the fdepl files using the
 *    FrancaPersistenceManager, and collects the ones that were not already specified in the fdepl.
 *
 * @note The loader does not support more than one fdepl file describing the same interfaces or types
 */
public class FrancaModelLoader<IA, TA> {

    private static final String FIDL_SUFFIX = "fidl";
    private static final String FDEPL_SUFFIX = "fdepl";
    private static final URI ROOT_URI = URI.createURI("classpath:/");

    // finds all fidl and fdepl files
    static private Collection<File> listFilesRecursively(File path) {
        if (path.isFile()) {
            return Collections.singletonList(path);
        }

        if (path.isDirectory()) {
            return FileUtils.listFiles(path,
                    new OrFileFilter(new SuffixFileFilter(FIDL_SUFFIX), new SuffixFileFilter(FDEPL_SUFFIX)),
                    DirectoryFileFilter.DIRECTORY);
        }

        return Collections.emptyList();
    }

    // groups the files by extension
    static private Map<String, List<File>> separateFiles(Collection<File> files) {
        Function<File, String> fileSuffix = f -> FilenameUtils.getExtension(f.getName());

        // create a map of absolute files, mapped by suffix to file
        Map<String, List<File>> map = files
                .stream()
                .map(f -> {
                    try { return f.getCanonicalFile(); } // this throws, which is not supported by the streams apis
                    catch (IOException e) { throw new RuntimeException(e); }
                })
                .collect(Collectors.groupingBy(fileSuffix));

        // ensure null lists are replaced by empty lists
        map.computeIfAbsent(FIDL_SUFFIX, k -> Collections.emptyList());
        map.computeIfAbsent(FDEPL_SUFFIX, k -> Collections.emptyList());

        return map;
    }

    // gets all the imported fidl from a fdepl file
    static private List<File> extractFidlImports(FDModel model) {
        File baseResource = new File(model.eResource().getURI().toFileString()).getParentFile();

        ArrayList<File> imports = new ArrayList<>();
        for (Import imp : model.getImports() ) {
            URI u = URI.createURI(imp.getImportURI());
            if (u.isFile() && u.fileExtension().equals(FIDL_SUFFIX)) {
                try {
                    File resolved = new File(baseResource, u.toFileString()).getCanonicalFile();
                    imports.add(resolved);
                } catch (IOException ignored) {
                    System.out.println("Could not resolve import " + u + " in " + baseResource);
                }
            }
        }
        return imports;
    }

    // loads a specification file and returns the first specification found
    private FDSpecification loadSpecification(String uri) {
        FDModel model = m_fdeplLoader.loadModel(URI.createURI(uri), ROOT_URI);

        if (model.getSpecifications().isEmpty()) {
            throw new RuntimeException("Could not load spec: " + uri +  ".");
        }

        return model.getSpecifications().get(0);
    }

    // builds a lists of FrancaModels for all the fidl & fdepl files in the given path
    public FrancaModel<IA, TA> load(String specPath, String path) {
        final FDSpecification spec = loadSpecification(specPath);
        System.out.println("Loaded specification " + spec);

        Collection<File> targetFiles = listFilesRecursively(new File(path));
        Map<String, List<File>> bySuffix = separateFiles(targetFiles);

        // load all found fdepl resources
        List<FDModel> extendedModels = bySuffix.get(FDEPL_SUFFIX).parallelStream().map(f -> {
            URI asUri = URI.createFileURI(f.getAbsolutePath());
            FDModel fdmodel = m_fdeplLoader.loadModel(asUri, ROOT_URI);
            System.out.println("Loading fdepl " + asUri);
            return fdmodel;
        }).collect(Collectors.toList());

        // collect all fidl files that are referenced by the fdepl, as the FDModel only
        // gives access to the interfaces and types that have deploy information attached
        // this is used for looking up deploy data below
        Map<File, FDModel> extendedFidl = new HashMap<>();
        for (FDModel fdm : extendedModels) {
            extractFidlImports(fdm).forEach( f -> extendedFidl.put(f, fdm));
        }
        Set<File> fidlFiles = new HashSet<>(extendedFidl.keySet());
        fidlFiles.addAll(bySuffix.get(FIDL_SUFFIX));

        FrancaModel<IA, TA> jointModel = new FrancaModel<>();

        // load all found fidl files and fill the FrancaModel from them
        List<FrancaModel<IA, TA>> models = fidlFiles.parallelStream().map(f -> {
            URI asUri = URI.createFileURI(f.getAbsolutePath());
            System.out.println("Loading fidl " + asUri);
            return m_fidlLoader.loadModel(asUri, ROOT_URI);
        }).map(fm -> {
            // try to fetch additional data, wrap in FrancaModel
            File resPath = new File(fm.eResource().getURI().toFileString());
            FDModel fdm = extendedFidl.get(resPath);

            return FrancaModel.create(m_factory, spec, fm, fdm);
        }).collect(Collectors.toList());

        // join all individual models into one
        models.forEach(jointModel::merge);

        return jointModel;
    }

    public FrancaModelLoader(SpecAccessorFactory<IA, TA> m_factory) {
        this.m_factory = m_factory;
    }

    private final SpecAccessorFactory<IA, TA> m_factory;

    @Inject
    private FDeployPersistenceManager m_fdeplLoader;
    @Inject
    private FrancaPersistenceManager m_fidlLoader;
}
