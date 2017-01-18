package com.here.ivi.api;

import com.here.navigation.LegacySpec;
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

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class FrancaModel {
    // FInterface with accessor
    static public class Interface {
        public FInterface fInterface;
        public LegacySpec.InterfacePropertyAccessor accessor; // TODO make this generic
        public Optional<FDInterface> fdInterface;

        // finds a matching FDInterface for an FInterface, if one is found, creates a valid InterfacePropertyAccessor,
        // otherwise creates an empty accessor that will return the defaults for a spec
        static public Interface create(FDSpecification spec, FInterface fi, FDModel fdm) {
            Interface result = new Interface();
            result.fInterface = fi;
            result.accessor = new LegacySpec.InterfacePropertyAccessor(FDHelper.createDummyFDElement(spec, fi));

            if (fdm != null) {
                FDModelExtender ext = new FDModelExtender(fdm);
                List<FDInterface> matches = ext.getFDInterfaces().stream().filter(fdi -> fi.getName().equals(
                        fdi.getTarget().getName())).collect(Collectors.toList());

                if (matches.size() > 1) {
                    throw new RuntimeException("Found multiple Interface matches, aborting.");
                } else if (!matches.isEmpty()) {
                    final FDInterface found = matches.get(0);
                    result.fInterface = found.getTarget();
                    result.fdInterface = Optional.ofNullable(found);
                    result.accessor = new LegacySpec.InterfacePropertyAccessor(new FDeployedInterface(found));
                }
            }
            return result;
        }
    }

    // FTypeCollection with accessor
    static public class TypeCollection {
        public FTypeCollection fTypeCollection;
        public LegacySpec.TypeCollectionPropertyAccessor accessor; // TODO make this generic
        public Optional<FDTypes> fdTypes;

        // finds a matching FDTypes for a FTypeCollection, if one is found, creates a valid TypeCollectionPropertyAccessor,
        // otherwise creates an empty accessor that will return the defaults for a spec
        static public TypeCollection create(FDSpecification spec, FTypeCollection tc, FDModel fdm) {
            TypeCollection result = new TypeCollection();
            result.fTypeCollection = tc;
            result.accessor = new LegacySpec.TypeCollectionPropertyAccessor(FDHelper.createDummyFDElement(spec, tc));

            if (fdm != null) {
                FDModelExtender ext = new FDModelExtender(fdm);
                List<FDTypes> matches = ext.getFDTypesList().stream().filter(fdt -> tc.getName().equals(
                        fdt.getTarget().getName())).collect(Collectors.toList());

                if (matches.size() > 1) {
                    throw new RuntimeException("Found multiple Interface matches, aborting.");
                } else if (!matches.isEmpty()) {
                    final FDTypes found = matches.get(0);
                    result.fTypeCollection = found.getTarget();
                    result.fdTypes = Optional.ofNullable(found);
                    result.accessor = new LegacySpec.TypeCollectionPropertyAccessor(new FDeployedTypeCollection(found));
                }
            }
            return result;
        }
    }

    // Information about the models
    static public class ModelInfo {
        public FModel fModel;
        public Optional<FDModel> fdModel;
    }

    // creates a FrancaModel from the given FModel & FDModel, ensuring that there are PropertyAccessors for each
    // element
    public static FrancaModel create(FDSpecification spec, FModel fm, FDModel fdm) {
        FrancaModel result = new FrancaModel();
        // get interface helpers
        result.interfaces = fm.getInterfaces()
                .parallelStream()
                .map(fi -> FrancaModel.Interface.create(spec, fi, fdm))
                .collect(Collectors.toList());

        // get type collection helpers
        result.typeCollections = fm.getTypeCollections()
                .parallelStream()
                .map(fi -> FrancaModel.TypeCollection.create(spec, fi, fdm))
                .collect(Collectors.toList());

        result.info = new ModelInfo();
        result.info.fModel = fm;
        result.info.fdModel = Optional.ofNullable(fdm);

        return result;
    }

    public ModelInfo info;
    public List<Interface> interfaces;
    public List<TypeCollection> typeCollections;
}
