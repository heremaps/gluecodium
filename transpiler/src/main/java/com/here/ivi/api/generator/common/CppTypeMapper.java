package com.here.ivi.api.generator.common;

import com.google.common.collect.Sets;
import com.here.ivi.api.model.cppmodel.*;
import com.here.ivi.api.model.Includes;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

import java.util.*;

public class CppTypeMapper {
    private final static Includes.SystemInclude INTYPES_INCLUDE = new Includes.SystemInclude("stdint.h");
    private final static Includes.SystemInclude VECTOR_INCLUDE = new Includes.SystemInclude("vector");
    private final static Includes.SystemInclude MAP_INCLUDE = new Includes.SystemInclude("map");
    private final static Includes.SystemInclude STRING_INCLUDE = new Includes.SystemInclude("string");

    public static CppType map(FTypeRef type) {
        if (type.getDerived() != null) {
            return mapDerived(type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppType();
    }

    private static CppType mapDerived(FTypeRef type) {
        FType derived = type.getDerived();

        // types without a parent are not valid
        if (derived.eContainer() == null) {
            return mapInvalidType(type);
        }

        if (derived instanceof FTypeDef) {
            return mapTypeDef( (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray( (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            return mapMap( (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct( (FStructType) derived);
        }

        return new CppType(null, "UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppType mapInvalidType(FTypeRef type) {
        CppType.DefinedBy definer = getDefinedBy(type);
        String name = "unknown";
        String typeDesc = "derived type";
        if (type.eContainer() instanceof FTypeDef) {
            name = ((FTypeDef) type.eContainer()).getName();
            typeDesc = "type reference";
        } else if (type.eContainer() instanceof FArgument) {
            name = ((FArgument) type.eContainer()).getName(); // TODO look at method name as well
            typeDesc = "argument";
        } else if (type.eContainer() instanceof FField) {
            name = ((FField) type.eContainer()).getName();
            typeDesc = "field";
        }
        System.err.println("Failed resolving " + typeDesc + " for '" + name + "' in " + definer + " (indicates wrong typedef or missing include)");
        return new CppType(definer, "INVALID DERIVED FOUND", CppElements.TypeInfo.Invalid);
    }

    // TODO there is a difference in the includes needed when defining a type versus when it is being used
    // This is not handled at the moment.

    private static CppType mapTypeDef(FTypeDef typedef) {

        CppType.DefinedBy typeRefDefiner = getDefinedBy(typedef);

        if (typedef.getActualType() == null) {
            return new CppType(typeRefDefiner, "NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            // each Instance type is defined directly in the Interface that is refers to, this is already
            // resolved in the typeRefDefiner
            return new CppType(typeRefDefiner, typeRefDefiner.type.getName(), CppElements.TypeInfo.InterfaceInstance);
        } else {
            FTypeRef underlyingType = typedef.getActualType();
            CppType.DefinedBy underlyingTypeDefiner = getDefinedBy(underlyingType);

            CppType actual = map(underlyingType);

            // lookup where type came from, setup includes
            Includes.Include include = new Includes.LazyInternalInclude(underlyingTypeDefiner);

            // actually use the typedef in this case, not the underlying type
            return new CppType(typeRefDefiner, typedef.getName(), actual.info, include);
        }
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

    public static CppType.DefinedBy getDefinedBy(EObject obj) {
        // search for parent type collection
        FTypeCollection tc = findDefiningTypeCollection(obj);

        if (tc == null || !(tc.eContainer() instanceof FModel)) {
            return null;
        }

        FModel model = (FModel)tc.eContainer();
        return new CppType.DefinedBy(tc, model);
    }

    public static CppType mapArray(FArrayType array) {

        CppType.DefinedBy arrayDefiner = getDefinedBy(array);

        FTypeRef elementType = array.getElementType();
        CppType actual = map(elementType);

        String typeName = array.getName(); // use name defined for array
        if (typeName != null) {
            // lookup where array typedef came from, setup includes
            Set<Includes.Include> includes = Sets.newHashSet(new Includes.LazyInternalInclude(arrayDefiner));

            return new CppType( arrayDefiner, typeName, CppElements.TypeInfo.Complex, includes);
        }

        CppType.DefinedBy elementDefiner = getDefinedBy(elementType);

        // lookup where array element type came from, setup includes
        Includes.Include include = new Includes.LazyInternalInclude(elementDefiner);

        CppType tmp = wrapArrayType(arrayDefiner, actual);
        tmp.includes.add(include);

        return tmp;
    }

    public static CppType wrapArrayType(CppType.DefinedBy definedIn, CppType actual) {

        // include element type and the vector
        Set<Includes.Include> includes = actual.includes;
        includes.add(VECTOR_INCLUDE);

        String typeName = "std::vector< " + actual.typeName + " >"; // if no name is given, fallback to underlying type

        return new CppType( definedIn, typeName, CppElements.TypeInfo.Complex, includes );
    }

    private static CppType mapMap(FMapType map) {
        CppType.DefinedBy mapDefiner = getDefinedBy(map);

        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppType(mapDefiner, "NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            CppType key = map(map.getKeyType());
            CppType value = map(map.getValueType());
            String typeName = "std::map< " + key.typeName + ", " + value.typeName + " >";

            // include key type, value type and the map
            Set<Includes.Include> includes = new HashSet<>(key.includes);
            includes.addAll(value.includes);
            includes.add(MAP_INCLUDE);

            return new CppType(mapDefiner, typeName, CppElements.TypeInfo.Complex, includes);
        }
    }

    private static CppType mapStruct(FStructType struct) {

        CppType.DefinedBy structDefiner = getDefinedBy(struct);

        if (struct.getElements().isEmpty() ) {
            return new CppType(structDefiner, "EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Includes.Include include = new Includes.LazyInternalInclude(structDefiner);

            return new CppType(structDefiner, struct.getName(), CppElements.TypeInfo.Complex, include);
        }
    }

    static final private String INSTANCE_ID_NAME = "Instance";
    static final private String INSTANCE_ID_TYPE = "InstanceId";
    static final private String INSTANCE_ID_MODEL = "com.here.BuiltIn";

    /*
     * This method is used in conjunction with com.here.BuiltIn.InstanceId
     * If a typedef is of the builtin type, than it will be resolved to the Interface that
     * contains the typedef.
     *
     * Example definition:
     *
     *  package com.here.navigation
     *
     *  import com.here.* from "classpath:/com/here/BuiltIn.fidl"
     *
     *  interface CustomInterface {
     *     version { major 1  minor 0 }
     *
     *     typedef Instance is BuiltIn.InstanceId
     *  }
     */
    private static boolean isInstanceId(FTypeDef typedef) {

        // must be named Instance
        if (INSTANCE_ID_NAME.equals(typedef.getName())) {
            // must reference a valid type
            FType target = typedef.getActualType().getDerived();
            if (target != null) {
                // must point to the exact com.here.BuiltIn.InstanceId
                if (INSTANCE_ID_TYPE.equals(target.getName())) {
                    CppType.DefinedBy defined = getDefinedBy(target);
                    return INSTANCE_ID_MODEL.equals(defined.toString());
                }
            }
        }

        return false;
    }

    private static CppType mapPredefined(FTypeRef type) {

        CppType.DefinedBy definer = getDefinedBy(type); // actually not needed for builtin types

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
