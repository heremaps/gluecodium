package com.here.ivi.api.model;

import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.*;

import java.util.Collection;


public class FDHelper {
    public static FDSpecification findSpec(Collection<FDModel> models) {
        FDSpecification spec = FDeployFactory.eINSTANCE.createFDSpecification();
        if (!models.isEmpty()) {
            // TODO check with multiple specs and find the correct one
            FDModel model = models.iterator().next();
            if (!model.getDeployments().isEmpty()) {
                return model.getDeployments().get(0).getSpec();
            }
        }

        return spec;
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
