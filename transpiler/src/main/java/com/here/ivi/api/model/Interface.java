package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.Version;
import com.here.ivi.api.loader.SpecAccessorFactory;
import navigation.CppStubSpec;
import org.franca.core.franca.FInterface;
import org.franca.deploymodel.core.FDModelExtender;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDModel;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;

import java.util.List;
import java.util.stream.Collectors;

/**
 * FInterface with accessor
 */
public class Interface<Accessor extends CppStubSpec.InterfacePropertyAccessor> implements FrancaElement {
    private Interface(FInterface francaInterface, Accessor accessor, ModelInfo model) {
        this.francaInterface = francaInterface;
        this.accessor = accessor;
        this.model = model;
    }

    final private FInterface francaInterface;
    final private Accessor accessor;
    final private ModelInfo model;

    @Override
    public String getName() {
        return francaInterface.getName();
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
        if (francaInterface.getVersion() != null) {
            return Version.create(francaInterface.getVersion());
        } else {
            return new Version(0, 0, 0);
        }
    }

    @Override
    public CppStubSpec.IDataPropertyAccessor getAccessor() {
        return accessor;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || !(o instanceof Interface<?>)) return false;
        Interface<?> co = (Interface<?>) o;
        return getName().equals(co.getName()) && model.getFrancaModel().getName().equals(co.model.getFrancaModel().getName());
    }

    public FInterface getFrancaInterface() {
        return francaInterface;
    }

    public Accessor getInterfaceAccessor() {
        return accessor;
    }

    // finds a matching FDInterface for an FInterface, if one is found, creates a valid InterfacePropertyAccessor,
    // otherwise creates an empty accessor that will return the defaults for a spec
    static public <IA extends CppStubSpec.InterfacePropertyAccessor> Interface<IA>
    create(SpecAccessorFactory<IA, ?> f, FDSpecification spec, ModelInfo info, FInterface fi, FDModel fdm) {

        FInterface francaInterface = fi;
        IA accessor = null;
        if (fdm != null) {
            FDModelExtender ext = new FDModelExtender(fdm);
            List<FDInterface> matches = ext.getFDInterfaces().stream().filter(fdi -> fi.getName().equals(
                    fdi.getTarget().getName())).collect(Collectors.toList());

            if (matches.size() > 1) {
                throw new RuntimeException("Found multiple Interface matches, aborting.");
            } else if (!matches.isEmpty()) {
                final FDInterface found = matches.get(0);
                francaInterface = found.getTarget();
                accessor = f.createInterfaceAccessor(new FDeployedInterface(found));
            }
        }
        if (accessor == null) {
            // create fallback accessor to use for defaults
            accessor = f.createInterfaceAccessor((FDeployedInterface) FDHelper.createDummyFDElement(spec, fi));
        }
        return new Interface<>(francaInterface, accessor, info);
    }
}
