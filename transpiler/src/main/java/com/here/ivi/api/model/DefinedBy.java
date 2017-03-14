package com.here.ivi.api.model;

import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

/**
 * This class stores the information where a type was defined
 * It is used for resolving namespaces
 */
public class DefinedBy {
    public DefinedBy(FTypeCollection type, FModel model) {
        this.type = type;
        this.model = model;
    }

    /** Returns the base name, eg. MyInterface */
    public String getBaseName() {
        return type.getName();
    }

    /** Returns the full package name, eg. com.here.navigation.guidance */
    public String getPackageName() {
        return model.getName();
    }

    /** Returns the split packages */
    public String[] getPackages() {
        return FrancaModel.splitPackage(getPackageName());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        DefinedBy definedBy = (DefinedBy) o;

        if (!getBaseName().equals(definedBy.getBaseName())) {
            return false;
        }
        return getPackageName().equals(definedBy.getPackageName());
    }

    @Override
    public int hashCode() {
        int result = getPackageName().hashCode();
        result = 31 * result + getBaseName().hashCode();
        return result;
    }

    @Override
    public String toString() {
        return getPackageName() + "." + getBaseName();
    }
    
    protected final FTypeCollection type; // A FInterface is a FTypeCollection as well
    protected final FModel model;
}
