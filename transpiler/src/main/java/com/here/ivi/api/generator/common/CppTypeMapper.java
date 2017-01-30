package com.here.ivi.api.generator.common;

import org.franca.core.franca.*;

import java.util.Collections;
import java.util.Set;

import static java.util.Arrays.asList;
import java.util.ArrayList;
import java.util.HashSet;

public class CppTypeMapper {
    private final static String INTYPES_INCLUDE = "stdint.h";
    private final static String VECTOR_INCLUDE = "vector.h";
    private final static String MAP_INCLUDE = "map.h";

    public static CppElements.CppType map(FTypeRef type) {
        if (type.getDerived() != null) {
            return mapDerived(type);
        } else if (type.getPredefined() != null) {
            return mapPredefined(type);
        }
        return new CppElements.CppType(type);
    }

    private static CppElements.CppType mapDerived(FTypeRef type) {
        FType derived = type.getDerived();
        if (derived instanceof FTypeDef) {
            return mapTypeDef(type, (FTypeDef) derived);
        }
        if (derived instanceof FArrayType) {
            return mapArray(type, (FArrayType) derived);
        }
        if (derived instanceof FMapType) {
            FMapType typedef = (FMapType) derived;
            return mapMap(type, (FMapType) derived);
        }
        if (derived instanceof FStructType) {
            return mapStruct(type, (FStructType) derived);
        }

        return new CppElements.CppType(type,"UNMAPPED DERIVED", CppElements.TypeInfo.Invalid);
    }

    private static CppElements.CppType mapTypeDef(FTypeRef type, FTypeDef typedef) {
        if (typedef.getActualType() == null) {
            return new CppElements.CppType(type,"NO ACTUAL TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else if (isInstanceId(typedef)) {
            CppElements.CppType actual = map(typedef.getActualType());
            // TODO check that this InstanceId is actually the correct one or add special fdepl info to it
            // TODO figure out the right include for this type
            return new CppElements.CppType(type, typedef.getName(), CppElements.TypeInfo.InterfaceInstance);
        } else {
            FTypeRef underlyingType = typedef.getActualType();

            CppElements.CppType actual = map(underlyingType);

            // TODO find where typedef is declared
            // TODO make sure its file is included correctly

            // actually use the typedef in this case, not the underlying type
            return new CppElements.CppType(type, typedef.getName(), actual.info);
        }
    }

    private static CppElements.CppType mapArray(FTypeRef type, FArrayType array) {
        if (array.getElementType() == null) {
            System.err.println("Failed resolving reference " + type.getDerived() + " ");
            return new CppElements.CppType(type,"NO ELEMENT TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            CppElements.CppType actual = map(array.getElementType());

            String typeName = array.getName(); // use name defined for array
            if (typeName != null) {
                // TODO lookup where typedef came from, setup includes
                Set<String> includes = Collections.emptySet();
                return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
            }

            return wrapArrayType(type, actual);
        }
    }

    public static CppElements.CppType wrapArrayType(FTypeRef type, CppElements.CppType actual) {
        Set<String> includes = actual.includes;
        includes.add(VECTOR_INCLUDE);
        String typeName = "std::vector< " + actual.typeName + " >"; // if no name is given, fallback to underlying type

        return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(actual));
    }

    private static CppElements.CppType mapMap(FTypeRef type, FMapType map) {
        if (map.getKeyType() == null || map.getValueType() == null ) {
            return new CppElements.CppType(type,"NO KEY OR VALUE TYPE FOUND", CppElements.TypeInfo.Invalid);
        } else {
            CppElements.CppType key = map(map.getKeyType());
            CppElements.CppType value = map(map.getValueType());
            String typeName = "std::map< " + key.typeName + ", " + value.typeName + " >";

            Set<String> includes = key.includes;
            value.includes.forEach(include -> { includes.add(include); });
            includes.add(MAP_INCLUDE);
            return new CppElements.CppType(type, typeName, CppElements.TypeInfo.Complex, includes, asList(key, value));
        }
    }

    private static CppElements.CppType mapStruct(FTypeRef type, FStructType struct) {
        if (struct.getElements().isEmpty() ) {
            return new CppElements.CppType(type,"EMPTY STRUCT", CppElements.TypeInfo.Invalid);
        } else {
            Set<String> includes = new HashSet<>();
            ArrayList<CppElements.CppType> references = new ArrayList<>();
            struct.getElements().forEach(element -> {
                CppElements.CppType elementType = map(element.getType());
                elementType.includes.forEach(include -> { includes.add(include); });
                references.add(elementType);
            });

            return new CppElements.CppType(type, struct.getName(), CppElements.TypeInfo.Complex, includes, references);
        }
    }

    private static boolean isInstanceId(FTypeDef typedef) {
        return typedef.getActualType().getDerived() != null &&
                "InstanceId".equals(typedef.getActualType().getDerived().getName());
    }

    private static CppElements.CppType mapPredefined(FTypeRef type) {
        switch (type.getPredefined().getValue()) {
            case FBasicTypeId.BOOLEAN_VALUE: return new CppElements.CppType(type, "bool", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.FLOAT_VALUE: return new CppElements.CppType(type, "float", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.DOUBLE_VALUE: return new CppElements.CppType(type, "double", CppElements.TypeInfo.BuiltIn);
            case FBasicTypeId.INT8_VALUE: return new CppElements.CppType(type, "int8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT16_VALUE: return new CppElements.CppType(type,"int16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT32_VALUE: return new CppElements.CppType(type,"int32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.INT64_VALUE: return new CppElements.CppType(type,"int64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT8_VALUE: return new CppElements.CppType(type,"uint8_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT16_VALUE: return new CppElements.CppType(type,"uint16_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT32_VALUE: return new CppElements.CppType(type,"uint32_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.UINT64_VALUE: return new CppElements.CppType(type,"uint64_t", CppElements.TypeInfo.BuiltIn, INTYPES_INCLUDE);
            case FBasicTypeId.STRING_VALUE: return new CppElements.CppType(type,"std::string", CppElements.TypeInfo.Complex, INTYPES_INCLUDE);
            case FBasicTypeId.BYTE_BUFFER_VALUE: return new CppElements.CppType(type,"std::vector< uint8_t >", CppElements.TypeInfo.Complex, VECTOR_INCLUDE);
            default: return new CppElements.CppType(type,"UNMAPPED PREDEFINED", CppElements.TypeInfo.Invalid);
        }
    }
}
