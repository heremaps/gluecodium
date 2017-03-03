package com.here.ivi.api.generator.common;

import com.google.common.collect.Sets;
import com.here.ivi.api.generator.cppstub.TypeCollectionGenerator;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaAnnotations;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.Includes;
import navigation.CppStubSpec;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

import java.util.*;
import java.util.logging.Logger;

// TODO there is a difference in the includes needed when defining a type versus when it is being used
// This is not handled at the moment.

public class CppTypeMapper {
    private final static Includes.SystemInclude INTYPES_INCLUDE = new Includes.SystemInclude("stdint.h");
    private final static Includes.SystemInclude VECTOR_INCLUDE = new Includes.SystemInclude("vector");
    private final static Includes.SystemInclude SET_INCLUDE = new Includes.SystemInclude("set");
    private final static Includes.SystemInclude MAP_INCLUDE = new Includes.SystemInclude("map");
    private final static Includes.SystemInclude STRING_INCLUDE = new Includes.SystemInclude("string");

    static Logger logger = java.util.logging.Logger.getLogger(CppTypeMapper.class.getName());

    public static CppType map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                              FArgument argument) {
        CppType type = CppTypeMapper.map(rootModel, argument.getType());

        if (argument.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel, type, CppTypeMapper.ArrayMode.map(rootModel, argument));
        }

        return type;
    }

    public static CppType map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                              FAttribute attribute) {
        CppType type = CppTypeMapper.map(rootModel, attribute.getType());

        if (attribute.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel, type, CppTypeMapper.ArrayMode.map(rootModel, attribute));
        }

        return type;
    }

    public static CppType map(CppModelAccessor rootModel, FField field) {
        CppType type = CppTypeMapper.map(rootModel, field.getType());

        if (field.isArray()) {
            type = CppTypeMapper.wrapArrayType(rootModel, type, CppTypeMapper.ArrayMode.map(rootModel, field));
        }

        return type;
    }

    public static CppType map(CppModelAccessor rootModel, FTypeRef type) {

        if (type.getDerived() != null) {
            return mapDerived(rootModel, type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppType();
    }

    private static CppType mapDerived(CppModelAccessor rootModel, FTypeRef type) {
        FType derived = type.getDerived();

        // types without a parent are not valid
        if (derived.eContainer() == null) {
            return mapInvalidType(rootModel, type);
        }

        if (derived instanceof FTypeDef) {
            return mapTypeDef( rootModel, (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray( rootModel, (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            return mapMap( rootModel, (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct( rootModel, (FStructType) derived);
        }
        if (derived instanceof FEnumerationType) {
            return mapEnum( rootModel, (FEnumerationType) derived);
        }

        return new CppType(null, "UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapInvalidType(CppModelAccessor rootModel, FTypeRef type) {
        DefinedBy definer = getDefinedBy(type);
        String name = "unknown";
        String typeDesc = "derived type";

        if (type.eContainer() instanceof FTypeDef) {
            name = ((FTypeDef) type.eContainer()).getName();
            typeDesc = "type reference";
        } else if (type.eContainer() instanceof FArgument) {
            FArgument arg = (FArgument) type.eContainer();
            name = arg.getName();

            // look at method name as well
            if (arg.eContainer() instanceof FMethod) {
                name = ((FMethod) arg.eContainer()).getName() + "::" + name;
            } else if (arg.eContainer() instanceof FBroadcast) {
                name = ((FMethod) arg.eContainer()).getName() + "::" + name;
            }

            typeDesc = "argument";
        } else if (type.eContainer() instanceof FField) {
            name = ((FField) type.eContainer()).getName();
            typeDesc = "field";
        } else if (type.eContainer() instanceof FAttribute) {
            name = ((FAttribute) type.eContainer()).getName();
            typeDesc = "attribute";
        }

        logger.severe("Failed resolving " + typeDesc + " for '" + name + "' in " + definer +
                " (indicates wrong typedef or missing include). Type included in " + rootModel + ".");

        return new CppType(definer, "INVALID DERIVED FOUND", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapTypeDef(CppModelAccessor rootModel, FTypeDef typedef) {

        DefinedBy typeRefDefiner = getDefinedBy(typedef);

        if (typedef.getActualType() == null) {
            return new CppType(typeRefDefiner, "NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            Includes.Include include = new Includes.LazyInternalInclude(typeRefDefiner);
            // each Instance type is defined directly in the Interface that is refers to, this is already
            // resolved in the typeRefDefiner
            return new CppType(typeRefDefiner, typeRefDefiner.type.getName(),
                    CppElements.TypeInfo.InterfaceInstance, include);
        } else if (isExternalReference(typedef)) {

            Map<FAnnotationType, Set<String>> comments = FrancaAnnotations.toMap(typedef.getComment().getElements());


            Set<Includes.Include> includes = new HashSet<>();
            CppElements.TypeInfo typeInfo = CppElements.TypeInfo.Complex;

            // resolve external includes
            Set<String> sourceUris = comments.get(FAnnotationType.SOURCE_URI);
            if (sourceUris != null) {
                for (String uri : sourceUris) {
                    includes.add(new Includes.SystemInclude(uri));
                }
            }
            // resolve external typedef
            Set<String> sourceAliases = comments.get(FAnnotationType.SOURCE_ALIAS);
            if (sourceAliases != null && sourceAliases.contains("nocomplex")) {
                typeInfo = CppElements.TypeInfo.BuiltIn;
            }

            return new CppType(typeRefDefiner, typedef.getName(), typeInfo, includes);
        } else {
            CppType actual = map(rootModel, typedef.getActualType());
            DefinedBy actualTypeDefiner = actual.definedIn;

            // lookup where type came from, setup includes
            Includes.Include include = new Includes.LazyInternalInclude(actualTypeDefiner);

            String namespacedName = prefixNamespace(rootModel, typeRefDefiner, typedef.getName());
            // actually use the typedef in this case, not the underlying type
            return new CppType(typeRefDefiner, namespacedName, actual.info, include);
        }
    }

    private static String prefixNamespace(CppModelAccessor rootModel,
                                          DefinedBy typeDefiner,
                                          String originalName) {

        // check that definition does not come from the same type
        if (rootModel == null || (rootModel.model.getName().equals(typeDefiner.model.getName()) &&
                 rootModel.type.getName().equals(typeDefiner.type.getName()))) {
            return originalName;
        }

        // TODO use namespace resolution that actually works across multiple namespaces
        // TODO use namespace resolution that respects the NameRules for packages

        return typeDefiner.type.getName() + "::" + originalName;
    }

    private static FTypeCollection findDefiningTypeCollection(EObject obj) {
        if (obj instanceof FTypeCollection) {
            return (FTypeCollection)obj; // FInterface is a FTypeCollection as well
        }

        EObject parent = obj.eContainer();

        if ((parent == obj) || (parent == null)) {
            return null;
        }

        return findDefiningTypeCollection(parent);
    }

    public static DefinedBy getDefinedBy(EObject obj) {
        // search for parent type collection
        FTypeCollection tc = findDefiningTypeCollection(obj);

        if (tc == null || !(tc.eContainer() instanceof FModel)) {
            throw new RuntimeException("Could not resolve root of EObject. Invalid franca definition. " + obj);
        }

        FModel model = (FModel)tc.eContainer();
        return new DefinedBy(tc, model);
    }

    public static CppType mapArray(CppModelAccessor rootModel, FArrayType array) {

        DefinedBy arrayDefiner = getDefinedBy(array);

        FTypeRef elementType = array.getElementType();
        CppType actual = map(rootModel, elementType);

        String typeName = array.getName(); // use name defined for array
        if (typeName != null) {
            // lookup where array typedef came from, setup includes
            Set<Includes.Include> includes = Sets.newHashSet(new Includes.LazyInternalInclude(arrayDefiner));

            typeName = prefixNamespace(rootModel, arrayDefiner, typeName);

            return new CppType( arrayDefiner, typeName, CppElements.TypeInfo.Complex, includes);
        }

        // if no name is given, fallback to underlying type
        return wrapArrayType(arrayDefiner, actual, ArrayMode.map(rootModel, array));
    }

    public static CppType defineArray(CppModelAccessor rootModel, FArrayType array) {
        DefinedBy arrayDefiner = getDefinedBy(array);
        FTypeRef elementType = array.getElementType();
        CppType actual = map(rootModel, elementType);

        return wrapArrayType(arrayDefiner, actual, ArrayMode.map(rootModel, array));
    }

    public enum ArrayMode {
        STD_VECTOR,
        STD_SET;

        public static ArrayMode map(CppModelAccessor<?> rootModel, FArrayType array) {
            if (rootModel.accessor.getIsSet(array)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<?> rootModel, FField field) {
            if (rootModel.accessor.getIsSet(field)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                                    FArgument argument) {
            if (rootModel.accessor.getIsSet(argument)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }

        public static ArrayMode map(CppModelAccessor<? extends CppStubSpec.InterfacePropertyAccessor> rootModel,
                                    FAttribute argument) {
            if (rootModel.accessor.getIsSet(argument)) {
                return STD_SET;
            }
            return STD_VECTOR;
        }
    }

    private static CppType wrapArrayType(DefinedBy definedIn, CppType elementType, ArrayMode mode) {

        // include element type and the vector
        Set<Includes.Include> includes = elementType.includes;

        // lookup where array element type came from, setup includes
        Includes.Include include = new Includes.LazyInternalInclude(elementType.definedIn);
        includes.add(include);

        String typeName = elementType.name;
        switch (mode) {
            case STD_VECTOR: {
                typeName = "std::vector< " + typeName  + " >";
                includes.add(VECTOR_INCLUDE);
                break;
            }
            case STD_SET: {
                typeName = "std::set< " + typeName  + " >";
                includes.add(SET_INCLUDE);
                break;
            }
        }

        return new CppType( definedIn, typeName, CppElements.TypeInfo.Complex, includes );
    }

    private static CppType mapMap(CppModelAccessor rootModel, FMapType map) {
        DefinedBy mapDefiner = getDefinedBy(map);

        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppType(mapDefiner, "NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {

            String typeName = map.getName(); // use name defined for map
            if (typeName != null) {
                // lookup where map typedef came from, setup includes
                Set<Includes.Include> includes = Sets.newHashSet(new Includes.LazyInternalInclude(mapDefiner));
                typeName = prefixNamespace(rootModel, mapDefiner, typeName);

                return new CppType( mapDefiner, typeName, CppElements.TypeInfo.Complex, includes);
            }

            CppType key = map(rootModel, map.getKeyType());
            CppType value = map(rootModel, map.getValueType());

            // if no names are given, fallback to underlying type
            return wrapMapType(mapDefiner, key, value);
        }
    }

    public static CppType wrapMapType(DefinedBy mapDefiner, CppType key, CppType value)
    {
        // lookup where array element type came from, setup includes
        Includes.Include keyInclude = new Includes.LazyInternalInclude(key.definedIn);
        Includes.Include valueInclude = new Includes.LazyInternalInclude(value.definedIn);

        String mapType = "std::map< " + key.name + ", " + value.name + " >";

        // include key type, value type and the map
        Set<Includes.Include> includes = new HashSet<>(key.includes);
        includes.add(keyInclude);
        includes.add(valueInclude);
        includes.add(MAP_INCLUDE);

        return new CppType(mapDefiner, mapType, CppElements.TypeInfo.Complex, includes);
    }

    private static CppType mapStruct(CppModelAccessor rootModel, FStructType struct) {

        DefinedBy structDefiner = getDefinedBy(struct);

        if (struct.getElements().isEmpty() ) {
            return new CppType(structDefiner, "EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Includes.Include include = new Includes.LazyInternalInclude(structDefiner);

            String typeName = prefixNamespace(rootModel, structDefiner, struct.getName());

            return new CppType(structDefiner, typeName, CppElements.TypeInfo.Complex, include);
        }
    }

    public static CppType mapEnum(CppModelAccessor rootModel, FEnumerationType enumeration) {
        DefinedBy enumDefiner = getDefinedBy(enumeration);

        if (enumeration.getEnumerators().isEmpty() ) {
            return new CppType(enumDefiner, "EMPTY ENUM", CppElements.TypeInfo.Invalid);
        } else {
            Includes.Include include = new Includes.LazyInternalInclude(enumDefiner);
            String typeName = prefixNamespace(rootModel, enumDefiner, enumeration.getName());

            return new CppType(enumDefiner, typeName, CppElements.TypeInfo.BuiltIn, include);
        }
    }

    static final private String BUILTIN_MODEL = "navigation.BuiltIn";
    static final private String INSTANCE_ID_NAME = "Instance";
    static final private String INSTANCE_ID_TYPE = "InstanceId";

    /*
     * This method is used in conjunction with navigation.BuiltIn.InstanceId
     * If a typedef is of the builtin type, than it will be resolved to the Interface that
     * contains the typedef.
     *
     * Example definition:
     *
     *  package navigation
     *
     *  import navigation.* from "classpath:/navigation/BuiltIn.fidl"
     *
     *  interface CustomInterface {
     *     version { major 1  minor 0 }
     *
     *     typedef Instance is BuiltIn.InstanceId
     *  }
     */
    public static boolean isInstanceId(FTypeDef typedef) {

        // must be named Instance
        if (INSTANCE_ID_NAME.equals(typedef.getName())) {
            // must reference a valid type
            FType target = typedef.getActualType().getDerived();
            if (target != null) {
                // must point to the exact navigation.BuiltIn.InstanceId
                if (INSTANCE_ID_TYPE.equals(target.getName())) {
                    DefinedBy defined = getDefinedBy(target);
                    return BUILTIN_MODEL.equals(defined.toString());
                }
            }
        }

        return false;
    }

    static final private String EXTERNAL_TYPE = "ExternalType";

    public static boolean isExternalReference(FTypeDef typedef) {
        FType target = typedef.getActualType().getDerived();
        if (target != null) {
            // must point to the exact navigation.BuiltIn.ExternalType
            if (EXTERNAL_TYPE.equals(target.getName())) {
                DefinedBy defined = getDefinedBy(target);
                return BUILTIN_MODEL.equals(defined.toString());
            }
        }

        return false;
    }

    private static CppType mapPredefined(FTypeRef type) {

        DefinedBy definer = getDefinedBy(type);

        int v = type.getPredefined().getValue();
        switch (v) {
            case FBasicTypeId.BOOLEAN_VALUE: return new CppType(definer, "bool", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new CppType(definer, "float", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new CppType(definer, "double", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new CppType(definer, "int8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new CppType(definer, "int16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new CppType(definer, "int32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new CppType(definer, "int64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new CppType(definer, "uint8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new CppType(definer, "uint16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new CppType(definer, "uint32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new CppType(definer, "uint64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new CppType(definer, "std::string", CppElements.TypeInfo.Complex, STRING_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new CppType(definer, "std::vector< uint8_t >", CppElements.TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new CppType(definer, "UNMAPPED PREDEFINED [" + type.getPredefined().getName() + "]", CppElements.TypeInfo.Invalid);
        }
    }
}
