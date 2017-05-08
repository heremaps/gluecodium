package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.SpecAccessorFactory;
import navigation.CppStubSpec;
import org.eclipse.xtext.util.Strings;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDModelExtender;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDModel;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class FrancaModel<InterfaceAccessor extends CppStubSpec.InterfacePropertyAccessor,
                         TypeCollectionAccessor extends CppStubSpec.TypeCollectionPropertyAccessor> {

    // Information about the models
    static public class ModelInfo {
        public FModel fModel;

        public String getName() { return fModel.getName(); }
        public String getPath() {
            return fModel.eResource().getURI().path();
        }
    }

    static List<String> splitPackage(String modelName) {
        return Strings.split(modelName, ".");
    }

    public interface FrancaElement {
        String getName();
        List<String> getPackage();
        ModelInfo getModel();
        Version getVersion();
        CppStubSpec.IDataPropertyAccessor getAccessor();
    }

    // FInterface with accessor
    static public class Interface<Accessor extends CppStubSpec.InterfacePropertyAccessor> implements FrancaElement {
        public FInterface fInterface;
        public Accessor accessor;
        public ModelInfo model;

        @Override
        public String getName() {
            return fInterface.getName();
        }

        @Override
        public ModelInfo getModel() {
            return model;
        }

        @Override
        public List<String> getPackage() {
            String name = model.fModel.getName();
            return splitPackage(name);
        }

        @Override
        public Version getVersion() {
            if (fInterface.getVersion() != null) {
                return Version.create(fInterface.getVersion());
            }
            else {
                return new Version(0,0,0);
            }
        }

        @Override
        public CppStubSpec.IDataPropertyAccessor getAccessor() {
            return accessor;
        }

        @Override
        public boolean equals(Object o) {
            if (o == null || !(o instanceof FrancaModel.Interface<?>)) return false;
            FrancaModel.Interface<?> co = (FrancaModel.Interface<?>)o;
            return getName().equals(co.getName()) && model.fModel.getName().equals(co.model.fModel.getName());
        }

        // finds a matching FDInterface for an FInterface, if one is found, creates a valid InterfacePropertyAccessor,
        // otherwise creates an empty accessor that will return the defaults for a spec
        static public <IA extends CppStubSpec.InterfacePropertyAccessor> Interface<IA>
        create(SpecAccessorFactory<IA, ?> f, FDSpecification spec, ModelInfo info, FInterface fi, FDModel fdm) {

            Interface<IA> result = new Interface<>();
            result.fInterface = fi;
            result.accessor = f.createInterfaceAccessor(
                    (FDeployedInterface) FDHelper.createDummyFDElement(spec, fi));
            result.model = info;

            if (fdm != null) {
                FDModelExtender ext = new FDModelExtender(fdm);
                List<FDInterface> matches = ext.getFDInterfaces().stream().filter(fdi -> fi.getName().equals(
                        fdi.getTarget().getName())).collect(Collectors.toList());

                if (matches.size() > 1) {
                    throw new RuntimeException("Found multiple Interface matches, aborting.");
                } else if (!matches.isEmpty()) {
                    final FDInterface found = matches.get(0);
                    result.fInterface = found.getTarget();
                    result.accessor = f.createInterfaceAccessor(new FDeployedInterface(found));
                }
            }
            return result;
        }
    }

    // FTypeCollection with accessor
    static public class TypeCollection<Accessor extends CppStubSpec.TypeCollectionPropertyAccessor> implements FrancaElement {
        public FTypeCollection fTypeCollection;
        public Accessor accessor;
        public ModelInfo model;
        public DefinedBy rootDefinition;

        @Override
        public String getName() {
            return fTypeCollection.getName();
        }

        @Override
        public ModelInfo getModel() {
            return model;
        }

        @Override
        public List<String> getPackage() {
            String name = model.fModel.getName();
            return splitPackage(name);
        }

        @Override
        public Version getVersion() {
            return Version.create(fTypeCollection.getVersion());
        }

        @Override
        public CppStubSpec.IDataPropertyAccessor getAccessor() {
            return accessor;
        }

        @Override
        public boolean equals(Object o) {
            if (o == null || !(o instanceof FrancaModel.TypeCollection<?>)) return false;
            FrancaModel.TypeCollection<?> co = (FrancaModel.TypeCollection<?>)o;
            return getName().equals(co.getName()) && model.fModel.getName().equals(co.model.fModel.getName());
        }

        // finds a matching FDTypes for a FTypeCollection, if one is found, creates a valid T
        // ypeCollectionPropertyAccessor, otherwise creates an empty accessor that will return the defaults for a spec
        static public <TA extends CppStubSpec.TypeCollectionPropertyAccessor> TypeCollection<TA>
        create(SpecAccessorFactory<?, TA> f, FDSpecification spec, ModelInfo info, FTypeCollection tc, FDModel fdm) {

            TypeCollection<TA> result = new TypeCollection<>();
            result.fTypeCollection = tc;
            result.accessor = f.createTypeCollectionAccessor(
                    (FDeployedTypeCollection) FDHelper.createDummyFDElement(spec, tc));
            result.model = info;
            result.rootDefinition = new DefinedBy(tc, info.fModel);

            if (fdm != null) {
                FDModelExtender ext = new FDModelExtender(fdm);
                List<FDTypes> matches = ext.getFDTypesList().stream().filter(fdt -> tc.getName().equals(
                        fdt.getTarget().getName())).collect(Collectors.toList());

                if (matches.size() > 1) {
                    throw new RuntimeException("Found multiple Interface matches, aborting.");
                } else if (!matches.isEmpty()) {
                    final FDTypes found = matches.get(0);
                    result.fTypeCollection = found.getTarget();
                    result.accessor = f.createTypeCollectionAccessor(new FDeployedTypeCollection(found));
                }
            }
            return result;
        }
    }

    // creates a FrancaModel from the given FModel & FDModel, ensuring that there are PropertyAccessors for each
    // element
    public static <IA extends CppStubSpec.InterfacePropertyAccessor, TA extends CppStubSpec.TypeCollectionPropertyAccessor> FrancaModel<IA, TA>
    create(SpecAccessorFactory<IA, TA> factory, FDSpecification spec, FModel fm, FDModel fdm) {

        FrancaModel<IA, TA> result = new FrancaModel<>();

        ModelInfo info = new ModelInfo();
        info.fModel = fm;

        // get interface helpers
        result.interfaces = fm.getInterfaces()
                .parallelStream()
                .map(fi -> FrancaModel.Interface.create(factory, spec, info, fi, fdm))
                .collect(Collectors.toList());

        // get type collection helpers
        result.typeCollections = fm.getTypeCollections()
                .parallelStream()
                .map(fi -> FrancaModel.TypeCollection.create(factory, spec, info, fi, fdm))
                .collect(Collectors.toList());

        return result;
    }

    public synchronized void merge(FrancaModel<InterfaceAccessor, TypeCollectionAccessor> other) {
        interfaces.addAll(other.interfaces);
        typeCollections.addAll(other.typeCollections);
    }

    public Optional<? extends FrancaElement> find(DefinedBy definer) {
        return find(definer.model, definer.type);
    }

    public Optional<? extends FrancaElement> find(FModel model, FTypeCollection needle) {
        return needle instanceof FInterface ? findInterface(model, (FInterface)needle) :
                                              findTypeCollection(model, needle);
    }

    public Optional<Interface<InterfaceAccessor>> findInterface(FModel model, FInterface needle) {
        return interfaces.stream()
                .filter(i -> i.getName().equals(needle.getName()) && i.getModel().getName().equals(model.getName()))
                .findFirst();
    }

    public Optional<TypeCollection<TypeCollectionAccessor>> findTypeCollection(FModel model, FTypeCollection needle) {
        return typeCollections.stream()
                .filter(i -> i.getName().equals(needle.getName()) && i.getModel().getName().equals(model.getName()))
                .findFirst();
    }

    public boolean isEmpty() {
        return interfaces.isEmpty() && typeCollections.isEmpty();
    }

    public List<Interface<InterfaceAccessor>> interfaces = new ArrayList<>();
    public List<TypeCollection<TypeCollectionAccessor>> typeCollections = new ArrayList<>();
}
