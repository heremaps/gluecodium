package com.here.ivi.api.model;

import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeDef;

/**
 * This class takes care of identifying instance references
 */
public final class InstanceHelper {
    static final private String BUILTIN_MODEL = "navigation.BuiltIn";
    static final private String INSTANCE_ID_POSTFIX = "Instance";
    static final private String INSTANCE_ID_TYPE = "InstanceId";

    /**
     * This method is used in conjunction with navigation.BuiltIn.InstanceId
     * If a typedef is of the builtin type, than it will be resolved to the Interface that
     * contains the typedef.
     *
     * Example definition:
     *
     * <code>
     * package navigation
     *
     * import navigation.* from "classpath:/navigation/BuiltIn.fidl"
     *
     * interface CustomInterface {
     *    version { major 1  minor 0 }
     *
     *    typedef CustomInterfaceInstance is BuiltIn.InstanceId
     * }
     * </code>
     */
    public static boolean isInstanceId(FTypeDef typedef) {

        // name must be ending with Instance
        if (typedef.getName() != null && typedef.getName().endsWith(INSTANCE_ID_POSTFIX)) {
            // it must reference a valid type
            FType target = typedef.getActualType().getDerived();
            if (target != null) {
                // and it must point to the exact navigation.BuiltIn.InstanceId
                if (INSTANCE_ID_TYPE.equals(target.getName())) {
                    DefinedBy defined = DefinedBy.getDefinedBy(target);
                    return BUILTIN_MODEL.equals(defined.toString());
                }
            }
        }

        return false;
    }
}
