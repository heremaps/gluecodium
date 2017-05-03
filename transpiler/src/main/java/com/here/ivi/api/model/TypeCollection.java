package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.SpecAccessorFactory;
import navigation.CppStubSpec;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDModelExtender;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.dsl.fDeploy.FDModel;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;

import java.util.List;
import java.util.stream.Collectors;

/**
 * FTypeCollection with accessor
 */
public class TypeCollection<Accessor extends CppStubSpec.TypeCollectionPropertyAccessor> implements FrancaElement {

    @Override
    public String getName() {
        return francaTypeCollection.getName();
    }

    @Override
    public ModelInfo getModel() {
        return model;
    }

    @Override
    public List<String> getPackage() {
        String name = model.getFrancaModel().getName();
        return PackageHelper.splitPackage(name);
    }

    @Override
    public Version getVersion() {
        return Version.create(francaTypeCollection.getVersion());
    }

    @Override
    public CppStubSpec.IDataPropertyAccessor getAccessor() {
        return accessor;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || !(o instanceof TypeCollection<?>)) return false;
        TypeCollection<?> co = (TypeCollection<?>) o;
        return getName().equals(co.getName()) && model.getFrancaModel().getName().equals(co.model.getFrancaModel().getName());
    }

    public FTypeCollection getFrancaTypeCollection() {
        return francaTypeCollection;
    }

    public Accessor getTypeCollectionAccessor() {
        return accessor;
    }

    // finds a matching FDTypes for a FTypeCollection, if one is found, creates a valid T
    // ypeCollectionPropertyAccessor, otherwise creates an empty accessor that will return the defaults for a spec
    static public <TA extends CppStubSpec.TypeCollectionPropertyAccessor> TypeCollection<TA>
    create(SpecAccessorFactory<?, TA> f, FDSpecification spec, ModelInfo info, FTypeCollection tc, FDModel fdm) {

        FTypeCollection francaTypeCollection = tc;

        TA accessor = null;
        if (fdm != null) {
            FDModelExtender ext = new FDModelExtender(fdm);
            List<FDTypes> matches = ext.getFDTypesList().stream().filter(fdt -> tc.getName().equals(
                    fdt.getTarget().getName())).collect(Collectors.toList());

            if (matches.size() > 1) {
                throw new RuntimeException("Found multiple Interface matches, aborting.");
            } else if (!matches.isEmpty()) {
                final FDTypes found = matches.get(0);
                francaTypeCollection = found.getTarget();
                accessor = f.createTypeCollectionAccessor(new FDeployedTypeCollection(found));
            }
        }
        if (accessor == null) {
            accessor = f.createTypeCollectionAccessor(
                    (FDeployedTypeCollection) FDHelper.createDummyFDElement(spec, tc));
        }
        return new TypeCollection<>(francaTypeCollection, accessor, info);
    }

    public TypeCollection(FTypeCollection francaTypeCollection, Accessor accessor, ModelInfo model) {
        this.francaTypeCollection = francaTypeCollection;
        this.accessor = accessor;
        this.model = model;
    }

    private final FTypeCollection francaTypeCollection;
    private final Accessor accessor;
    private final ModelInfo model;
}
