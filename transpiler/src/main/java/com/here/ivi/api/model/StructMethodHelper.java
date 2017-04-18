package com.here.ivi.api.model;

import com.here.ivi.api.generator.cppstub.CppStubStructGenerator;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.*;
import java.util.logging.Logger;

public class StructMethodHelper {
    private static final Logger logger = Logger.getLogger(StructMethodHelper.class.getName());

    private static final String STRUCT_INITIALIZER_METHOD_NAME = "init";
    private static final String BELONGING_STRUCT_CONSTANT_NAME = "type";

    public static FStructType findStructType(
            FrancaModel.TypeCollection<? extends CppStubSpec.TypeCollectionPropertyAccessor> tc) {

        FStructType memberStruct = null;
        for (FType type : tc.fTypeCollection.getTypes()) {
            if (type.getName().equals(BELONGING_STRUCT_CONSTANT_NAME) &&
                    type instanceof FStructType) {
                memberStruct = (FStructType) type;
                break;
            }
        }
        return memberStruct;
    }

    public static boolean isStructInitializer(FMethod method) {
        return STRUCT_INITIALIZER_METHOD_NAME.equals(method.getName());
    }

    public static boolean isBelongingStruct(FConstantDef constantDef) {
        return constantDef.getType().getDerived().getName().equals(StructMethodHelper.BELONGING_STRUCT_CONSTANT_NAME);
    }

    // Contains a struct and its methods
    public static class StructMethodPair {
        public final FrancaModel.TypeCollection<?> type;
        public final FrancaModel.Interface<?> iface;

        public StructMethodPair(FrancaModel.TypeCollection<?> type, FrancaModel.Interface<?> iface) {
            this.type = type;
            this.iface = iface;
        }
    }

    public static List< StructMethodPair > collectMethodContainers(final FrancaModel<?, ?> model) {

        List< StructMethodPair > result = new ArrayList<>();

        // for each type collection: search its methods (if any)
        for (FrancaModel.TypeCollection<?> tc : model.typeCollections) {

            if (tc.accessor.getIsStructDefinition(tc.fTypeCollection)) {
                // find real interface
                FInterface fi = tc.accessor.getBelongingMethodContainer(tc.fTypeCollection);

                if (fi != null) {
                    Optional<? extends FrancaModel.Interface<?>> fiOptional =
                            model.interfaces.stream().filter(i -> fi.equals(i.fInterface)).findFirst();

                    if (fiOptional.isPresent()) {
                        result.add(new StructMethodPair(tc, fiOptional.orElse(null)));
                    } else {
                        logger.severe("Error: FranceModel.Interface could not be found: " + fi);
                    }
                } else {
                    logger.severe("Error: Belonging interface could not be found for " + tc);
                }
            }
        }

        return result;
    }
}
