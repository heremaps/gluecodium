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

    // TODO there is a difference in the includes needed when defining a type versus when it is being used
    // This is not handled at the moment.

    private static CppType mapTypeDef(FTypeDef typedef) {

        CppType.DefinedBy typeRefDefiner = getDefinedBy(typedef);

        if (typedef.getActualType() == null) {
            return new CppType(typeRefDefiner, "NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {

            // TODO check that this InstanceId is actually the correct one or add special fdepl info to it
            // TODO figure out the right include for this type
            // TODO figure out correct reference definer (should be an FInterface!)

            return new CppType(typeRefDefiner, typedef.getName(), CppElements.TypeInfo.InterfaceInstance);
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

        if (array.getElementType() == null) {
            System.err.println("Failed resolving array element type (indicates wrong typedef)");
            return new CppType(arrayDefiner, "NO ELEMENT TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
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

    private static boolean isInstanceId(FTypeDef typedef) {
        return typedef.getActualType().getDerived() != null &&
                "InstanceId".equals(typedef.getActualType().getDerived().getName());
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
