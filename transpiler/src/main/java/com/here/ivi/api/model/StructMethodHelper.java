package com.here.ivi.api.model;

import com.here.ivi.api.generator.common.GeneratedFile;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

import java.util.*;
import java.util.function.Function;
import java.util.logging.Logger;
import java.util.stream.Stream;

/**
 * This class contains methods that identify struct-with-method pairs and allows filtering
 * the FrancaModel accordingly.
 */
public class StructMethodHelper {
    private static final Logger logger = Logger.getLogger(StructMethodHelper.class.getName());

    private static final String STRUCT_INITIALIZER_METHOD_NAME = "init";
    private static final String BELONGING_STRUCT_CONSTANT_NAME = "DefiningType";

    /**
     * Finds the FStruct that defines the whole TypeCollection
     * @param tc The TypeCollection that will be searched
     * @return the struct or null if
     */
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

    /**
     * Checks whether a method is a struct initializer
     *
     * @param method The method to check
     * @return true if the method is a struct initializer
     */
    public static boolean isStructInitializer(FMethod method) {
        return STRUCT_INITIALIZER_METHOD_NAME.equals(method.getName());
    }

    /**
     * Tests whether the Constant is actually pointing to a defining Struct
     * @param constantDef The constant to check
     * @return true if the constant points to a struct
     */
    public static boolean isBelongingStruct(FConstantDef constantDef) {
        return BELONGING_STRUCT_CONSTANT_NAME.equals(constantDef.getType().getDerived().getName());
    }

    /**
     * A pair of TypeCollection & Interface to model structs with methods
     *
     * @param <IA> The Interface accessor
     * @param <TA> The TypeCollection accessor
     */
    public static class StructMethodPair<
            IA extends CppStubSpec.InterfacePropertyAccessor,
            TA extends CppStubSpec.TypeCollectionPropertyAccessor> {
        public final FrancaModel.Interface<IA> iface;
        public final FrancaModel.TypeCollection<TA> type;

        StructMethodPair(FrancaModel.Interface<IA> iface, FrancaModel.TypeCollection<TA> type) {
            this.iface = iface;
            this.type = type;
        }
    }

    /**
     * Divides the given model into three streams:
     *  - All bare interfaces
     *  - All type collections
     *  - All structs that have methods, a pair of iface & typecollection
     *
     * The elements are exclusive to each stream, so the
     *
     * @param model the input model
     * @param interfaceCollector the mapping function for all bare interfaces
     * @param typeCollector the mapping function for all type collections
     * @param structWithMethodCollector the mapping function the combination of iface & typecollection
     *
     * @param <Result> The result type, share between all Functions
     * @param <IA> The Interface accessor
     * @param <TA> The TypeCollection accessor
     *
     * @return a stream of Result
     */
    public static
    <Result, IA extends CppStubSpec.InterfacePropertyAccessor, TA extends CppStubSpec.TypeCollectionPropertyAccessor>
    Stream< Result > partitionModel(FrancaModel<IA, TA> model,
                                    Function<FrancaModel.Interface<IA>, List<Result> > interfaceCollector,
                                    Function<FrancaModel.TypeCollection<TA>, Result> typeCollector,
                                    Function<StructMethodPair<IA, TA>, Result> structWithMethodCollector) {

        List<StructMethodPair<IA, TA>> structMethodPairs = collectMethodContainers(model);

        return Stream.concat(
                Stream.concat(
                        // generate one file for each type collection, containing all the typedefs, enums, etc.
                        model.getTypeCollections().stream()
                                .filter(tc -> !tc.accessor.getIsStructDefinition(tc.fTypeCollection))
                                .map(typeCollector),

                        // every interface (that is not a struct) gets its own file
                        model.getInterfaces().stream()
                                .filter(iface -> iface.accessor.getIsMethodContainer(iface.fInterface) == null ||
                                        !iface.accessor.getIsMethodContainer(iface.fInterface))
                                .map(interfaceCollector)
                                .flatMap(Collection::stream)
                ),
                structMethodPairs.stream().map(structWithMethodCollector));
    }

    /**
     * Goes through all typeCollections of the model, takes the ones that are a struct definition and collects the
     * related interfaces into a central list.
     *
     * @param model the input model
     * @param <IA> The Interface accessor
     * @param <TA> The TypeCollection accessor
     * @return A list of interface typeCollection pairs
     */
    private static
    <IA extends CppStubSpec.InterfacePropertyAccessor, TA extends CppStubSpec.TypeCollectionPropertyAccessor>
    List< StructMethodPair<IA, TA>  > collectMethodContainers(final FrancaModel<IA, TA> model) {

        List< StructMethodPair<IA, TA> > result = new ArrayList<>();

        // for each type collection: search its methods (if any)
        for (FrancaModel.TypeCollection<TA> tc : model.getTypeCollections()) {

            if (tc.accessor.getIsStructDefinition(tc.fTypeCollection)) {
                // find real interface
                FInterface fi = tc.accessor.getBelongingMethodContainer(tc.fTypeCollection);

                if (fi != null) {
                    Optional<FrancaModel.Interface<IA>> fiOptional =
                            model.getInterfaces().stream().filter(i -> fi.equals(i.fInterface)).findFirst();

                    if (fiOptional.isPresent()) {
                        result.add(new StructMethodPair<>(fiOptional.orElse(null), tc));
                    } else {
                        logger.severe("Error: FranceModel.Interface could not be found: " + fi);
                    }
                } else {
                    result.add(new StructMethodPair<>(null, tc));
                }
            }
        }

        return result;
    }
}
