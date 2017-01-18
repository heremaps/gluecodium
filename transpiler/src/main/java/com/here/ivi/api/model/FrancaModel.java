package com.here.ivi.api.model;

import com.here.ivi.api.loader.SpecAccessorFactory;
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
import java.util.stream.Collectors;

@SuppressWarnings("WeakerAccess")
public class FrancaModel<InterfaceAccessor, TypeCollectionAccessor> {

    // Information about the models
    static public class ModelInfo {
        public FModel fModel;
        public FDModel fdModel;
    }

    // FInterface with accessor
    static public class Interface<Accessor> {
        public FInterface fInterface;
        public Accessor accessor;
        public FDInterface fdInterface;
        public ModelInfo model;

        // finds a matching FDInterface for an FInterface, if one is found, creates a valid InterfacePropertyAccessor,
        // otherwise creates an empty accessor that will return the defaults for a spec
        static public <IA> Interface<IA> create(SpecAccessorFactory<IA, ?> f, FDSpecification spec,
                                                ModelInfo info, FInterface fi, FDModel fdm) {
            Interface<IA> result = new Interface<>();
            result.fInterface = fi;
            result.accessor = f.createInterfaceAccessor(FDHelper.createDummyFDElement(spec, fi));
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
                    result.fdInterface = found;
                    result.accessor = f.createInterfaceAccessor(new FDeployedInterface(found));
                }
            }
            return result;
        }
    }

    // FTypeCollection with accessor
    static public class TypeCollection<Accessor> {
        public FTypeCollection fTypeCollection;
        public Accessor accessor;
        public FDTypes fdTypes;
        public ModelInfo model;

        // finds a matching FDTypes for a FTypeCollection, if one is found, creates a valid T
        // ypeCollectionPropertyAccessor, otherwise creates an empty accessor that will return the defaults for a spec
        static public <TA> TypeCollection<TA> create(SpecAccessorFactory<?, TA> f, FDSpecification spec,
                                                     ModelInfo info, FTypeCollection tc, FDModel fdm) {
            TypeCollection<TA> result = new TypeCollection<>();
            result.fTypeCollection = tc;
            result.accessor = f.createTypeCollectionAccessor(FDHelper.createDummyFDElement(spec, tc));
            result.model = info;

            if (fdm != null) {
                FDModelExtender ext = new FDModelExtender(fdm);
                List<FDTypes> matches = ext.getFDTypesList().stream().filter(fdt -> tc.getName().equals(
                        fdt.getTarget().getName())).collect(Collectors.toList());

                if (matches.size() > 1) {
                    throw new RuntimeException("Found multiple Interface matches, aborting.");
                } else if (!matches.isEmpty()) {
                    final FDTypes found = matches.get(0);
                    result.fTypeCollection = found.getTarget();
                    result.fdTypes = found;
                    result.accessor = f.createTypeCollectionAccessor(new FDeployedTypeCollection(found));
                }
            }
            return result;
        }
    }

    // creates a FrancaModel from the given FModel & FDModel, ensuring that there are PropertyAccessors for each
    // element
    public static <IA, TA> FrancaModel<IA, TA> create(SpecAccessorFactory<IA, TA> factory,
                                                      FDSpecification spec, FModel fm, FDModel fdm) {
        FrancaModel<IA, TA> result = new FrancaModel<>();

        ModelInfo info = new ModelInfo();
        info.fModel = fm;
        info.fdModel = fdm;

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

    public List<Interface<InterfaceAccessor>> interfaces = new ArrayList<>();
    public List<TypeCollection<TypeCollectionAccessor>> typeCollections = new ArrayList<>();
}
